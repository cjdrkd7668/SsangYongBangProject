/*##################################################
*	Wyditor v1.3.4 Light
*
*	@author		HanSeungho landboy@gmail.com
*	@copyright	Copyright (c) HanSeungho
*
*	작성일 :			2007-12-06
*	최종수정일 :	2009-06-27
##################################################*/

var isIE = (navigator.userAgent.toLowerCase().indexOf("msie") != -1); // ie 여부
var isIE11 = (!!navigator.userAgent.match(/Trident\/7\./))
var isPageLoaded = false; // 페이지 로딩완료여부

var wyditorPath = "/common/editor"; // 에디터 경로

var arrWyditor = new Array();

var wyditorCurIframe, wyditorCurAction;

// 배열
Array.prototype.inArray = function (value) {
	for (var key in this) {
		if (this[key] == value) {
			return true;
		}
	}
	return false;
};

// 이벤트
function addEvent(obj, evt, exec) {
	if (isIE) obj.attachEvent('on'+evt, exec);
	else if (window.addEventListener) obj.addEventListener(evt, exec, false);
	else if (window.attachEvent) obj.attachEvent(evt, exec);
};

function removeEvent(obj, evt, exec) {
	if (isIE) obj.detachEvent('on'+evt, exec);
	else if (window.removeEventListener) obj.removeEventListener(evt, exec, false);
	else if (window.detachEvent) obj.detachEvent(evt, exec);
};

addEvent(window, "load", function () { isPageLoaded = true; });

// 위치
function getOffset(obj) {
	var objOffset = { left : 0, top : 0 };
	var objOffsetParent = obj.offsetParent;

	objOffset.left = obj.offsetLeft;
	objOffset.top = obj.offsetTop;

	while (objOffsetParent) {
		objOffset.left += objOffsetParent.offsetLeft;
		objOffset.top += objOffsetParent.offsetTop;

		objOffsetParent = objOffsetParent.offsetParent;
	}

	return objOffset;
};

// 팝업
function openWyditorPopup(theURL, winName, width, height, etcFeatures) {
	var left = (screen.width/2) - (width/2);
	var top = (screen.availHeight/2) - (height/2);
	var features = "left="+left+",top="+top+",width="+width+",height="+height+",status=yes";
	if (etcFeatures) features += ","+etcFeatures;

	var popup = window.open(theURL, winName, features);
	if (popup) popup.focus();

	return popup;
};


// 기본환경설정
function wyditorConfig () {
	this.imgWidth = 650;					// 에디터 이미지 폭
	this.uploadPath = '';						// 에디터 업로드 경로	(공백인 경우 업로드 처리 기본경로 사용)

	this.isKeepPositive = false;			// [IE Only] 이미지 및 링크 삽입시 상대경로가 절대경로로 변환된것을 유지할지 여부
														// ※ true : 유지, false : 상대경로로 수정

	this.isUseEnterBr	= false;			// [IE Only] 엔터(개행)시 <p>태그가 아닌 Shift+Enter(<br>)으로 변환할 것인지 여부
														// ※ true : 사용, false : 사용안함

	this.htmlMode = '';						// Html소스보기 모드
														// ※ '': 노출, 'hide': 숨김

	this.toolbarBgcolor = "#F0F0F0";					// 툴바 배경 색상
	this.lineColor = "#E6E6E6";							// 라인 색상
	this.textareaBgcolor = "#F5F5F5";				// Textarea 배경 색상

	// 기본 툴바 항목
	this.arrToolbarItem = [
		"fontname", // 글꼴
		"_", // 공백 (구분선 사용시 '|')
		"fontsize", // 크기
		"_",
		"bold", "italic", "underline", "strike", // 굵게, 기울림꼴, 밑줄, 취소선
		"forecolor", "backcolor", // 글자색, 배경색
		"_",
		"left", "center", "right", // 왼쪽맞춤, 가운데맞춤, 오른쪽맞춤
		"_",
		"orderedlist", "unorderedlist", "indent", "outdent", // 숫자목록, 점목록, 들여쓰기, 내여쓰기
		"_",
		"link", // 링크삽입
		"unlink", // 링크제거
		"_",
		"hr", // 가로선
		"_",
		"image", // 이미지업로드
		"_",
		"multimedia", // 멀티미디어링크
		"_",
		"preview" // 미리보기
	];

	// 글꼴
	this.arrFont = {
		"돋움" : "가나다(돋움)",
		"굴림" : "가나다(굴림)",
		"바탕" : "가나다(바탕)",
		"궁서" : "가나다(궁서)",
		"Arial" : "abcdefghij(Arial)",
		"Tahoma" : "abcdefghij(Tahoma)",
		"Verdana" : "abcdefghij(Verdana)",
		"Time" : "abcdefghij(Time)"
	};

	// 크기
	this.arrFontSize = {
		"1" : "가나다(8pt)",
		"2" :	"가나다(10pt)",
		"3" :	"가나다(12pt)",
		"4" :	"가나다(14pt)",
		"5" :	"가나다(18pt)",
		"6" :	"가나다(24pt)",
		"7" :	"가나다(36pt)"
	};
};

// 현재 URL 제거 및 절대경로->상대경로 변환
function wyditorConvertRelative(objEditor) {
	var url = document.URL;
	var domain = document.location.protocol+'//'+document.location.host;
	var i, len;

	// 현재 URL 제거
	if (isIE) {
		var arrA = objEditor.objIfrm.contentWindow.document.getElementsByTagName("A");
		for (i=0, len=arrA.length; i<len; i++) {
			if (arrA[i].href.indexOf(url) != -1) {
				arrA[i].href = arrA[i].href.replace(url, '');
			}
		}
	}

	// 절대경로->상대경로 변환
	if (isIE && !objEditor.config.isKeepPositive) {
		var arrImg = objEditor.objIfrm.contentWindow.document.getElementsByTagName("IMG");
		for (i=0, len=arrImg.length; i<len; i++) {
			if (arrImg[i].src.indexOf(domain) != -1) {
				arrImg[i].src = arrImg[i].src.replace(domain, '');
			}
		}
		var arrA = objEditor.objIfrm.contentWindow.document.getElementsByTagName("A");
		for (i=0, len=arrA.length; i<len; i++) {
			if (arrA[i].href.indexOf(domain) != -1) {
				arrA[i].href = arrA[i].href.replace(domain, '');
			}
		}
	}
};

// 태그정리
function adjustTag(objEditor) {
	var html = objEditor.objIfrm.contentWindow.document.body.innerHTML;
	html = html.replace(/<P[^>]*>/gi, "<P>");
	html = html.replace(/<\/P[^>]*>/gi, "</P>");
	if (html == "<P>&nbsp;</P>" || html == "<P></P>") {
		objEditor.objIfrm.contentWindow.document.body.innerHTML = "";
	}
};

// 복제 관련
function wyditorClone(objEditor) {
	if (objEditor.objIfrm.style.display == 'none') {
		try {
			objEditor.objIfrm.contentWindow.document.body.innerHTML = objEditor.objText.value;
		}
		catch (e) {}
	}
	wyditorConvertRelative(objEditor);
	adjustTag(objEditor);
	objEditor.objText.value = objEditor.objIfrm.contentWindow.document.body.innerHTML;
	objEditor.orgTextarea.value = objEditor.objText.value;
};

// 키이벤트 가로채기 관련
function wyditorInterceptKey(e, objEditor) {
	var e = window.event || e;
	var keyCode = e.keyCode || e.charCode;
	if (isIE) {
		try {
			var range = objEditor.objIfrm.contentWindow.document.selection.createRange();
			var parent = range.parentElement();

			if (objEditor.config.isUseEnterBr && keyCode == 13 && e.shiftKey == false && range.parentElement().nodeName != 'LI') {
				e.cancelBubble = true;
				e.returnValue = false;
				range.pasteHTML('<br />');
				range.select();
			}

			if (keyCode == 9) {
				e.cancelBubble = true;
				e.returnValue = false;
				objEditor.objIfrm.contentWindow.document.selection.createRange().pasteHTML("&nbsp;&nbsp;&nbsp;");
			}
		}
		catch (e) { }

		return false;
	}
};

// 글꼴, 크기, 색상 선택 레이어 처리
function displayLayer(action, objButton, objIfrm) {
	var layerId;

	hideLayer();

	if (action) {
		switch (action) {
			case 'fontname':
				layerId = "divWyditorFont";
				break;
			case 'fontsize':
				layerId = "divWyditorFontSize";
				break;
			case 'forecolor':
			case 'backcolor':
				layerId = "divWyditorColorPicker";
				break;
			case 'link':
				layerId = "divWyditorLink";
				break;
			default :
				return false;
		}

		var objLayer = document.getElementById(layerId);
		if (objLayer) {
			var objPos = getOffset(objButton);

			if (layerId == "divWyditorColorPicker") {
				document.getElementById("wyditorColorTitle").innerHTML = (action=="forecolor") ? "글자색" : "배경색";
			}

			objLayer.style.left = objPos.left+'px';
			objLayer.style.top = (objPos.top+objButton.offsetHeight)+'px';
			objLayer.style.display = '';

			window.focus();
			objLayer.focus();
			objLayer.blur();

			if (layerId == "divWyditorLink") initWyditorLink(objIfrm);

			setTimeout(function () { addEvent(document, 'click', clickHideLayer) }, 300);
		}
	}
};

function clickHideLayer(e) {
	var e = window.event || e;
	var objElement = (e.srcElement) ? e.srcElement : e.target;

	var objParent = objElement.parentNode;
	while (objParent) {
		if (objParent && objParent.id.indexOf('divWyditor') > -1) return;
		objParent = objParent.offsetParent;
	}

	hideLayer();
};

function hideLayer() {
	removeEvent(document, 'click', clickHideLayer);

	if (document.getElementById('divWyditorFont')) document.getElementById('divWyditorFont').style.display = 'none';
	if (document.getElementById('divWyditorFontSize')) document.getElementById('divWyditorFontSize').style.display = 'none';
	if (document.getElementById('divWyditorColorPicker')) document.getElementById('divWyditorColorPicker').style.display = 'none';
	if (document.getElementById('divWyditorLink')) document.getElementById('divWyditorLink').style.display = 'none';
};

// 글꼴 관련
function makeWyditorFont(objTarget, arrFont) {
	if (!document.getElementById("divWyditorFont")) {
		var objDiv = document.createElement('DIV');
		objDiv.setAttribute("id", "divWyditorFont");
		objDiv.style.position = "absolute";
		objDiv.style.backgroundColor = "#FFFFFF";
		objDiv.style.border = "1px solid #DDDDDD";
		objDiv.style.zIndex = 101;
		objDiv.style.display = "none";
			for (var font in arrFont) {
				if (arrFont[font]) {
					var objDiv1 = document.createElement('DIV');
					objDiv1.setAttribute('font', font);
					objDiv1.style.width = '150px';
					objDiv1.style.padding = '1px 3px 1px 3px';
					objDiv1.style.fontSize = '9pt';
					objDiv1.style.color = '#696969';
					objDiv1.style.padding = '3px';
					objDiv1.style.cursor = 'pointer';
					objDiv1.onmouseover = function() { this.style.backgroundColor='#E0E0E0' };
					objDiv1.onmouseout = function() { this.style.backgroundColor='' };
					objDiv1.onmousedown = function() { selectWyditorFont(this.getAttribute('font')); };
						var objFont = document.createElement('FONT');
						objFont.face = font;
						objFont.innerHTML = arrFont[font];
						objDiv1.appendChild(objFont);
					objDiv.appendChild(objDiv1);
				}
			}
		objTarget.parentNode.appendChild(objDiv);
	}
};

function selectWyditorFont(font) {
	setTimeout(function() {
		focusIfrm(wyditorCurIframe);
		if (wyditorCurIframe.selection.type == 'Control') return;
		wyditorCurIframe.contentWindow.document.execCommand("fontname", false, font);
	}, 100);
	hideLayer();
};

// 크기 관련
function makeWyditorFontSize(objTarget, arrFontSize) {
	if (!document.getElementById("divWyditorFontSize")) {
		var objDiv = document.createElement('DIV');
		objDiv.setAttribute("id", "divWyditorFontSize");
		objDiv.style.position = "absolute";
		objDiv.style.backgroundColor = "#FFFFFF";
		objDiv.style.border = "1px solid #DDDDDD";
		objDiv.style.zIndex = 102;
		objDiv.style.display = "none";
			for (var size in arrFontSize) {
				if (arrFontSize[size]) {
					var objDiv1 = document.createElement('DIV');
					objDiv1.setAttribute('size', size);
					objDiv1.style.width = '300px';
					objDiv1.style.padding = '1px 3px 1px 3px';
					objDiv1.style.fontSize = '9pt';
					objDiv1.style.color = '#696969';
					objDiv1.style.padding = '3px';
					objDiv1.style.cursor = 'pointer';
					objDiv1.onmouseover = function() { this.style.backgroundColor='#E0E0E0' };
					objDiv1.onmouseout = function() { this.style.backgroundColor='' };
					objDiv1.onmousedown = function() { selectWyditorFontSize(this.getAttribute('size')); };
						var objFont = document.createElement('FONT');
						objFont.size = size;
						objFont.innerHTML = arrFontSize[size];
						objDiv1.appendChild(objFont);
					objDiv.appendChild(objDiv1);
				}
			}
		objTarget.parentNode.appendChild(objDiv);
	}
};

function selectWyditorFontSize(fontsize) {
	setTimeout(function() {
		focusIfrm(wyditorCurIframe);
		if (wyditorCurIframe.selection.type == 'Control') return;
		wyditorCurIframe.contentWindow.document.execCommand("fontsize", false, parseInt(fontsize, 10));
	}, 100);
	hideLayer();
};

// 색상선택 관련
function makeWyditorColor(objTarget) {
	if (!document.getElementById("divWyditorColorPicker")) {
		var objDiv = document.createElement('DIV');
		objDiv.setAttribute("id", "divWyditorColorPicker");
		objDiv.style.position = "absolute";
		objDiv.style.backgroundColor = "#FFFFFF";
		objDiv.style.zIndex = 103;
		objDiv.style.display = "none";

		var sHtml = "<table border='0' cellpadding='0' cellspacing='1' bgcolor='#CCCCCC'>"
			+"<tr height='20'>"
			+"<td bgcolor='#FFFFFF'>"
			+"<table cellpadding='0' cellspacing='0' border='0' width='100%'><tr>"
			+"<td width='35%' valign='bottom' style='padding-left:5px;'><div id='wyditorColorTitle' style='font-size:9pt; color:#696969;'></div></td>"
			+"<td width='65%' align='right'>"
			+"<table border=0 cellpadding=0 cellspacing=0 style='border:1px solid #CCCCCC; margin-right:2px;'>"
			+"<tr height='14'><td id='wyditorSampleColor' width='70' bgcolor='#FFFFFF'></td></tr>"
			+"</table>"
			+"</td>"
			+"</tr></table>"
			+"</td>"
			+"</tr>"
			+"<tr height='131'>"
			+"<td width='131' align='center' bgcolor='#FFFFFF'>"
			+"<table cellspacing='1' cellpadding='0' border='0'>"
			+"<col width='12'><col width='12'><col width='12'><col width='12'><col width='12'><col width='12'><col width='12'><col width='12'><col width='12'><col width='12'>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFFFFF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#E5E4E4'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D9D8D8'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C0BDBD'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#A7A4A4'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#8E8A8B'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#827E7F'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#767173'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#5C585A'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#000000'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FEFCDF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FEF4C4'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FEED9B'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FEE573'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFED43'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F6CC0B'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#E0B800'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C9A601'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#AD8E00'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#8C7301'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFDED3'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFC4B0'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF9D7D'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF7A4E'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF6600'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#E95D00'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D15502'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#BA4B01'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#A44201'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#8D3901'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFD2D0'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFBAB7'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FE9A95'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF7A73'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF483F'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FE2419'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F10B00'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D40A00'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#940000'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#6D201B'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFDAED'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFB7DC'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FFA1D1'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF84C3'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FF57AC'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FD1289'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#EC0078'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D6006D'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#BB005F'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#9B014F'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FCD6FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#FBBCFF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F9A1FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F784FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F564FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F546FF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#F328FF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D801E5'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C001CB'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#8F0197'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#E2F0FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C7E2FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#ADD5FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#92C7FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#6EB5FF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#48A2FF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#2690FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#0162F4'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#013ADD'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#0021B0'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D3FDFF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#ACFAFD'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#7CFAFF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#4AF7FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#1DE6FE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#01DEFF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#00CDEC'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#01B6DE'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#00A0C2'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#0084A0'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#EDFFCF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#DFFEAA'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D1FD88'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#BEFA5A'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#A8F32A'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#8FD80A'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#79C101'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#3FA701'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#307F00'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#156200'></td>"
			+"</tr>"
			+"<tr height='12'>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#D4C89F'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#DAAD88'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C49578'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C2877E'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#AC8295'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#C0A5C4'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#969AC2'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#92B7D7'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#80ADAF'></td>"
			+"<td style='cursor:pointer;' onMouseOver='setWyditorSampleColor(this)' onMouseDown='selectWyditorColor(this);' bgcolor='#9CA53B'></td>"
			+"</tr>"
			+"</table>"
			+"</td>"
			+"</tr>"
			+"</table>";
		objDiv.innerHTML = sHtml;

		objTarget.parentNode.appendChild(objDiv);
	}
};

function setWyditorSampleColor(item) {
	var color = item.bgColor.toUpperCase();

	if (color.length == 7) {
		document.getElementById("wyditorSampleColor").style.backgroundColor = color;
	}
	else {
		document.getElementById("wyditorSampleColor").style.backgroundColor = "";
	}
};

function selectWyditorColor(item) {
	var color = item.bgColor.toUpperCase();
	var action = (!isIE && wyditorCurAction == "backcolor") ? "hilitecolor" : wyditorCurAction;

	setTimeout(function() {
		focusIfrm(wyditorCurIframe);
		if (wyditorCurIframe.selection.type == 'Control') return;
		wyditorCurIframe.contentWindow.document.execCommand(action, false, color);
	}, 100);
	hideLayer();
};

// 링크 관련
function makeWyditorLink(objTarget) {
	if (!document.getElementById("divWyditorLink")) {
		var objDiv = document.createElement('DIV');
		objDiv.setAttribute("id", "divWyditorLink");
		objDiv.style.position = "absolute";
		objDiv.style.backgroundColor = "#FFFFFF";
		objDiv.style.border = "1px solid #DDDDDD";
		objDiv.style.padding = "5px";
		objDiv.style.zIndex = 104;
		objDiv.style.display = "none";

		var sHtml = "<fieldset style='border:0; padding:5px 5px 5px 5px; font-size:12px;'>"
			+"<legend style='padding:0 5px 0 5px; -moz-user-select:none;' unselectable='on'>하이퍼링크</legend>"
			+"<div style='padding-top:5px'>"
			+"<input type='text' id='wyditorLink' value='http://' style='width:180px; font-size:9pt; color:#696969; border:1px solid #CFCFCF;' onKeyUp='onWyditorLinkEnter(event); return false;'></td>"
			+"</div>"
			+"<div style='padding:0 0 5px 80px; -moz-user-select:none' unselectable='on'><input type='checkbox' id='wyditorLinkBlank' checked>새창으로 열기</div>"
			+"<div align='center' style='-moz-user-select:none' unselectable='on'>"
			+"<img src='"+wyditorPath+"/images/btn_confirm.gif' hspace='2' onClick='setWyditorLink()' style='cursor:pointer'>"
			+"<img src='"+wyditorPath+"/images/btn_cancel.gif' hspace='2' onClick='hideLayer()' style='cursor:pointer'>"
			+"</div>"
			+"</fieldset>";
		objDiv.innerHTML = sHtml;

		objTarget.parentNode.appendChild(objDiv);
	}
};

function initWyditorLink(objIfrm) {
	var objTxt = document.getElementById("wyditorLink");
	var objCb = document.getElementById("wyditorLinkBlank")

	if (!objTxt) return;

	var selection = objIfrm.selection;
	var range = objIfrm.range;
	var anchor = null;
	var url = 'http://';
	var isTargetBlank = true;

	if (isIE) {
		var selectionType = (range ? selection.type : '');
		if (selectionType == 'Text') {
			anchor = (range.parentElement().tagName.toUpperCase()!='IMG' ? range.parentElement() : range.parentElement().parentNode);
		}
		else if (selectionType == 'Control' && range.item(0).tagName.toUpperCase() == 'IMG') {
			anchor = range.item(0).parentNode;
		}
	}
	else {
		var node = range.commonAncestorContainer;

		if (isIE11){
			range = objIfrm.contentWindow.document.getSelection().getRangeAt(0);
			node = range.commonAncestorContainer;
			while(node){
				if(node.nodeName.toUpperCase() == 'A') { break; }
				node = node.firstChild;
			}
		}
		while (node) {
			if (node.nodeName.toUpperCase() == 'A') { anchor = node; break; }
			node = node.parentNode;
		}
	}

	if (anchor && anchor.nodeName.toUpperCase() == 'A') {
		url = anchor.href;
		isTargetBlank = (anchor.getAttribute('target')=='_blank' ? true : false);
	}

	objCb.checked = isTargetBlank;
	objTxt.value = url;
	objTxt.focus();
};

function onWyditorLinkEnter(e) {
	var e = window.event || e;
	var keyCode = (window.event ? e.keyCode : e.which);
	if (keyCode == 13) setWyditorLink();
};

function setWyditorLink() {
	var objTxt = document.getElementById("wyditorLink");
	var objCb = document.getElementById("wyditorLinkBlank")
	var url = objTxt.value;

	if(!(/^(http|https|ftp|mailto):(?:\/\/)?((\w|-)+(?:[\.:@](\w|-))+)(?:\/|@)?([^"\?]*?)(?:\?([^\?"]*?))?$/.test(url.toLowerCase()))){
		alert("URL을 올바르게 입력해 주세요.");
		objTxt.focus();
		objTxt.select();
		return false;
	}

	focusIfrm(wyditorCurIframe);

	var selection = wyditorCurIframe.selection;
	var range = wyditorCurIframe.range;

	var anchor = null;

	if (isIE) {
		if ((range?selection.type:'') == 'None') {
			wyditorCurIframe.range.pasteHTML(
				"&nbsp;"+"<a href=\""+url+"\""+(objCb.checked?" target=\"_blank\"":"")+">"+url+"</a>"+"&nbsp;"
			);
		}
		else {
			range.execCommand('UnLink', false);
			range.execCommand('CreateLink', false, url);

			if (range.parentElement) anchor = range.parentElement();
			else {
				var parent = range.item(0);
				while (parent) {
					if (parent.tagName.toUpperCase() == 'A') { anchor = parent; break; }
					parent = parent.parentElement;
				}
			}
		}
	}
	else {
		if (isIE11){
			var text = '';
			var doc = wyditorCurIframe.contentWindow.document;
			var range = doc.getSelection().getRangeAt(0);
			var nnode = doc.createElement('p');
			text = nodeSerialize(range.cloneContents());

			doc.execCommand('UnLink', false);
			doc.execCommand('CreateLink', false, url);

			var objRangeS;
			var objRangeE;
			var objRangeR;
			try{
				objRangeS = range.startContainer;
				objRangeE = range.endContainer;

				while (objRangeS.nodeName.toUpperCase()!="BODY" && objRangeS.parentNode != objRangeE.parentNode){
					objRangeE = objRangeE.parentNode;
				}
				objRangeR = objRangeS.parentNode;

				var flag = false;
				for (var n=0; n<objRangeR.childNodes.length; n++){
					if (objRangeR.childNodes[n]==objRangeS){
						flag=true;
					}
					if (objRangeR.childNodes[n]==objRangeE){
						objRangeR.childNodes[n].getElementsByTagName("A")[0].target = (objCb.checked?"_blank":"")
						flag=false;
					}

					if (flag){
						objRangeR.childNodes[n].getElementsByTagName("A")[0].target = (objCb.checked?"_blank":"")
					}
				}
			}catch(e){
				objRangeS = range.startContainer.parentNode;
				objRangeE = range.endContainer;

				while (objRangeS.nodeName.toUpperCase()!="BODY" && objRangeS.parentNode != objRangeE.parentNode){
					objRangeS = objRangeS.parentNode;
					objRangeE = objRangeE.parentNode;
				}
				objRangeR = objRangeS.parentNode;

				var flag = false;
				for (var n=0; n<objRangeR.childNodes.length; n++){
					if (objRangeR.childNodes[n]==objRangeS){
						flag=true;
					}
					if (objRangeR.childNodes[n]==objRangeE){
						objRangeR.childNodes[n].getElementsByTagName("A")[0].target = (objCb.checked?"_blank":"")
						flag=false;
					}

					if (flag){
						objRangeR.childNodes[n].getElementsByTagName("A")[0].target = (objCb.checked?"_blank":"")
					}
				}
			}
			nnode = null;
		}else{
			var text = '';
			if (selection.rangeCount > 0 && window.XMLSerializer) {
				text = new XMLSerializer().serializeToString(range.cloneContents());
			}
			wyditorCurIframe.contentWindow.document.execCommand("InsertHTML", false,
				"<a href=\""+url+"\""+(objCb.checked?" target=\"_blank\"":"")+">"+(text?text:url)+"</a>"
			);
		}
	}

	if (anchor) {
		try {
			if (objCb.checked) { anchor.setAttribute('target', "_blank"); }
			else if (anchor.getAttribute('target')) { anchor.removeAttribute('target'); };
		}
		catch(e) {};
	}

	hideLayer();
};

// NODE 객체 시리얼라이저
function nodeSerialize(obj) {
	var returnStr = "";
	for (var n=0; n<obj.childNodes.length; n++){
		if (obj.childNodes[n].nodeType==1){
			if (obj.childNodes[n].getElementsByTagName("A").length>0){
				returnStr += obj.childNodes[n].innerText;
			}else{
				returnStr += obj.childNodes[n].outerHTML;
			}
		}else if (obj.childNodes[n].nodeType==3){
			returnStr += obj.childNodes[n].nodeValue;
		}
	}
	return returnStr;
}

// 에디터(Iframe)포커스 관련
function focusIfrm(objIfrm) {
	(objIfrm.contentWindow || objIfrm).focus();
	if (isIE) {
		objIfrm.range.select();
	}
	else {
		objIfrm.selection.removeAllRanges();
		objIfrm.selection.addRange(objIfrm.range);
	}
};

// 미리보기
function openWyditorPreview(objEditor, width) {
	var objPop = openWyditorPopup("about:blank", "WyditorPreview", width+20, 600, "scrollbars=yes");

	objPop.document.open();
	objPop.document.write("<html><head><title>미리보기</title>");
	objPop.document.write("<style type='text/css'>");
	if (isIE)	objPop.document.write("p { margin:0; word-break:break-all; }");
	else		objPop.document.write("p { margin:0; white-space:-moz-pre-wrap; }");
	objPop.document.write("body, table, td{ font-family:'굴림'; font-size:9pt; }");
	objPop.document.write("</style>");
	objPop.document.write("</head><body bgcolor='#FFFFFF' style='margin:10px;'>");
	objPop.document.write("<table id='tbContent' cellpadding='0' cellspacing='0' border='0' width='100%' style='table-layout:fixed;'>");
	objPop.document.write("<tr><td style='word-wrap:break-word; word-break:break-all;' valign='top' bgcolor='FFFFFF'>");
	objPop.document.write("<div style='overflow:auto; width:100%;'>");
	objPop.document.write(objEditor.objIfrm.contentWindow.document.body.innerHTML);
	objPop.document.write("</div>");
	objPop.document.write("</td></tr>");
	objPop.document.write("</table>");
	objPop.document.write("<"+"script type='text/javascript'"+">");
	objPop.document.write("function resizeImage() {");
	objPop.document.write("var objLimit = document.getElementById('tbContent');");
	objPop.document.write("if (objLimit) {");
	objPop.document.write("var fixWidth = objLimit.clientWidth;");
	objPop.document.write("var arrImgs = objLimit.getElementsByTagName('IMG');");
	objPop.document.write("for (var i=0, len=arrImgs.length; i<len; i++) { if (parseInt(arrImgs[i].width, 10) > fixWidth) arrImgs[i].width = fixWidth; }");
	objPop.document.write("}}");
	objPop.document.write("resizeImage();");
	objPop.document.write("<\/"+"script"+">");
	objPop.document.write("</body></html>");
	objPop.document.close();
};

function wyditorUploadOk(textareaName, url) {
	if (arrWyditor[textareaName]) {
		arrWyditor[textareaName].addLink(url);
	}
};

function wyditorLinkMediaOk(textareaName, url) {
	if (arrWyditor[textareaName]) arrWyditor[textareaName].addLink(url);
};

// 에디터
function wyditor(textareaName) {
	var self = this;

	this.config = new wyditorConfig();

	this.textareaName = textareaName;
	this.contentPadding = 10;

	this.widthUnit = null;

	arrWyditor[textareaName] = self;
};

wyditor.prototype.setToolbar = function (arrToolbar) {
	if (arrToolbar) this.config.arrToolbarItem = arrToolbar;
};

wyditor.prototype.setImgWidth = function (imgWidth) {
	if (imgWidth) this.config.imgWidth = imgWidth;
};

wyditor.prototype.setUploadPath = function (path) {
	if (path) this.config.uploadPath = path;
};

wyditor.prototype.setHtmlMode = function (htmlMode) {
	if (htmlMode) this.config.htmlMode = htmlMode.toLowerCase();
};

wyditor.prototype.create = function () {
	var self = this;

	// 원 Textarea
	this.orgTextarea = document.getElementsByName(this.textareaName)[0];
	this.orgTextarea.id = this.textareaName;
	this.orgTextarea.style.display = 'none';

	this.widthUnit = (this.orgTextarea.style.width.substr(this.orgTextarea.style.width.length-1, this.orgTextarea.style.width.length) == '%') ? '%' : 'px';

	this.orgTextareaWidth = parseInt(this.orgTextarea.style.width, 10);
	this.orgTextareaHeight = parseInt(this.orgTextarea.style.height, 10);

	// 에디터 - Textarea 생성
	this.objText = document.createElement("textarea");
	this.objText.setAttribute("id", this.textareaName+"_textarea");
	this.objText.style.width = this.orgTextareaWidth+this.widthUnit;
	this.objText.style.height = (this.orgTextareaHeight-2)+'px';
	this.objText.style.border = "0";
	this.objText.style.overflow = "auto";
	this.objText.style.display = "none";
//	this.objText.onmouseout = function () { try { wyditorClone(self) } catch (e) {} };

	// 에디터 - Iframe 생성
	this.objIfrm = document.createElement("iframe");
	this.objIfrm.setAttribute("id", this.textareaName+"_iframe");
	this.objIfrm.setAttribute("scrolling", "auto");
	this.objIfrm.setAttribute("frameBorder", "0");
	this.objIfrm.setAttribute("marginWidth", "0");
	this.objIfrm.setAttribute("marginHeight", "0");
	this.objIfrm.setAttribute("wrap", "virtual");
	this.objIfrm.style.width = this.orgTextareaWidth+this.widthUnit;
	this.objIfrm.style.height = this.orgTextareaHeight+'px';
	this.objIfrm.onmouseout = function () { try { wyditorClone(self) } catch (e) {} };

	this.objTable = document.createElement("table");
	this.objTable.setAttribute("id", this.textareaName+"_table");
	this.objTable.setAttribute("border", "0");
	this.objTable.setAttribute("cellPadding", "0");
	this.objTable.setAttribute("cellSpacing", "0");
	this.objTable.setAttribute("width", this.orgTextareaWidth+this.widthUnit);
	this.objTable.style.tableLayout = "fixed";

		var objTbody = document.createElement("tbody");

		var objTr1 = document.createElement("tr");
		objTr1.bgColor = this.config.toolbarBgcolor;
			var objTdToolbar = document.createElement("td");
			objTdToolbar.setAttribute("id", this.textareaName+"_toolbarTd");
			if (isIE) objTdToolbar.setAttribute("unselectable", "on");
			else objTdToolbar.style.MozUserSelect = "none";
			objTdToolbar.style.padding = "5px";
			objTdToolbar.style.borderBottom = "1px solid "+this.config.lineColor;
				// 툴바
				var objDivToolbarLeft = document.createElement("div");
				objDivToolbarLeft.setAttribute("id", this.textareaName+"_toolbarLeft");
				if (isIE) {
					objDivToolbarLeft.style.styleFloat = "left";
				}
				else {
					objDivToolbarLeft.style.cssFloat = "left";
				}
				objDivToolbarLeft.appendChild(this.createToolbar());
			objTdToolbar.appendChild(objDivToolbarLeft);
			if (this.config.htmlMode != 'hide') {
				// 소스보기 버튼
					var objDivToolbarRight = document.createElement("div");
					objDivToolbarRight.setAttribute("id", this.textareaName+"_toolbarRight");
					if (isIE) {
						objDivToolbarRight.style.styleFloat = "right";
						objDivToolbarRight.setAttribute("unselectable", "on");
					}
					else {
						objDivToolbarRight.style.cssFloat = "right";
						objDivToolbarRight.style.MozUserSelect = "none";
					}
						this.objButtonHtml = document.createElement("img");
						this.objButtonHtml.setAttribute("id", this.textareaName+"_html");
						this.objButtonHtml.setAttribute("src", wyditorPath+"/images/html.gif");
						this.objButtonHtml.setAttribute("title", "소스보기");
						this.objButtonHtml.setAttribute("align", "absmiddle");
						this.objButtonHtml.setAttribute("border", "0");
						if (isIE)	this.objButtonHtml.style.filter = "alpha(opacity=60)";
						else		this.objButtonHtml.style.opacity = "0.6";
						this.objButtonHtml.style.cursor = "pointer";
						this.objButtonHtml.onclick = function () { self.changeEditorMode() };
					objDivToolbarRight.appendChild(this.objButtonHtml);
				objTdToolbar.appendChild(objDivToolbarRight);
			}
		objTr1.appendChild(objTdToolbar);

		var objTr2 = document.createElement("tr");
		objTr2.setAttribute("vAlign", "top");
			var objTdIfrm = document.createElement("td");
			objTdIfrm.setAttribute("id", this.textareaName+"_ifrm");
			objTdIfrm.setAttribute("bgColor", self.config.textareaBgcolor);
		objTr2.appendChild(objTdIfrm);

		objTbody.appendChild(objTr1);
		objTbody.appendChild(objTr2);

	this.objTable.appendChild(objTbody);

	this.orgTextarea.parentNode.insertBefore(this.objTable, this.orgTextarea);
	objTdIfrm.appendChild(this.objIfrm);
	objTdIfrm.appendChild(this.objText);

	if (this.config.arrToolbarItem.inArray("fontname")) {
		makeWyditorFont(this.objTable, this.config.arrFont);
	}
	if (this.config.arrToolbarItem.inArray("fontsize")) {
		makeWyditorFontSize(this.objTable, this.config.arrFontSize);
	}
	if (this.config.arrToolbarItem.inArray("forecolor") || this.config.arrToolbarItem.inArray("backcolor")) {
		makeWyditorColor(this.objTable);
	}
	if (this.config.arrToolbarItem.inArray("link")) {
		makeWyditorLink(this.objTable);
	}

	setTimeout(function () { self.initContent(); }, 10);

	return true;
};

wyditor.prototype.createToolbar = function () {
	var self = this;
	var objToolItem = null;

	var objDivToolbar = document.createElement("div");
	objDivToolbar.setAttribute("id", this.textareaName+"_toolbarButtons");
	if (isIE) objDivToolbar.setAttribute("unselectable", "on");
	else objDivToolbar.style.MozUserSelect = "none";

	for (var i=0, len=this.config.arrToolbarItem.length; i<len; i++) {
		objToolItem = null;
		switch (this.config.arrToolbarItem[i]) {
			case "fontname" :
				objToolItem = this.createButton("/images/fontname.gif", "fontname", "글꼴");
				break;
			case "fontsize" :
				objToolItem = this.createButton("/images/fontsize.gif", "fontsize", "크기");
				break;
			case "bold":
				objToolItem = this.createButton("/images/bold.gif", "bold", "굵게");
				break;
			case "italic":
				objToolItem = this.createButton("/images/italic.gif", "italic", "기울림꼴");
				break;
			case "underline":
				objToolItem = this.createButton("/images/underline.gif", "underline", "밑줄");
				break;
			case "strike":
				objToolItem = this.createButton("/images/strike.gif", "StrikeThrough", "취소선");
				break;
			case "forecolor":
				objToolItem = this.createButton("/images/forecolor.gif", "forecolor", "글자색");
				break;
			case "backcolor":
				objToolItem = this.createButton("/images/backcolor.gif", "backcolor", "배경색");
				break;
			case "left":
				objToolItem = this.createButton("/images/left.gif", "justifyleft", "왼쪽맞춤");
				break;
			case "center":
				objToolItem = this.createButton("/images/center.gif", "justifycenter", "가운데맞춤");
				break;
			case "right":
				objToolItem = this.createButton("/images/right.gif", "justifyright", "오른쪽맞춤");
				break;
			case "orderedlist":
				objToolItem = this.createButton("/images/orderedlist.gif", "insertorderedlist", "숫자목록");
				break;
			case "unorderedlist":
				objToolItem = this.createButton("/images/unorderedlist.gif", "insertunorderedlist", "점목록");
				break;
			case "indent":
				objToolItem = this.createButton("/images/indent.gif", "indent", "들여쓰기");
				break;
			case "outdent":
				objToolItem = this.createButton("/images/outdent.gif", "outdent", "내여쓰기");
				break;
			case "link":
				objToolItem = this.createButton("/images/link.gif", "link", "링크삽입");
				break;
			case "unlink":
				objToolItem = this.createButton("/images/unlink.gif", "unlink", "링크제거");
				break;
			case "hr":
				objToolItem = this.createButton("/images/hr.gif", "InsertHorizontalRule", "가로선");
				break;
			case "image":
				objToolItem = this.createButton("/images/image.gif", "image", "이미지업로드");
				break;
			case "multimedia":
				objToolItem = this.createButton("/images/multimedia.gif", "multimedia", "멀티미디어링크");
				break;
			case "preview":
				objToolItem = this.createButton("/images/preview.gif", "preview", "미리보기");
				break;
			case "|":
				objToolItem = this.createSlide();
				break;
			case "_":
				objToolItem = this.createSpace();
				break;
		}
		if (objToolItem) objDivToolbar.appendChild(objToolItem);
	}

	return objDivToolbar;
};

wyditor.prototype.createButton = function (src, action, title) {
	var self = this;

	var objButton = document.createElement("img");
	objButton.setAttribute("src", wyditorPath+src);
	if (title) objButton.setAttribute("title", title);
	objButton.setAttribute("action", action);
	objButton.setAttribute("align", "absmiddle");
	objButton.setAttribute("border", "0");
	objButton.style.cursor = "pointer";
	objButton.onclick = function () { self.eventHandler(this); return true; } ;

	return objButton;
};

wyditor.prototype.createSpace = function () {
	var objBlank = document.createElement("img");
	objBlank.setAttribute("src", wyditorPath+"/images/blank.gif");
	objBlank.setAttribute("width", "3");
	objBlank.setAttribute("align", "absmiddle");

	return objBlank;
};

wyditor.prototype.createSlide = function () {
	var objLine = document.createElement("img");
	objLine.setAttribute("src", wyditorPath+"/images/slide.gif");
	objLine.setAttribute("align", "absmiddle");
	objLine.setAttribute("border", "0");

	return objLine;
};

wyditor.prototype.initContent = function() {
	var self = this;
	var objCont = self.objIfrm.contentWindow;

	var objDoc = objCont.document;
	objDoc.open();
	objDoc.write("<html><head>");
	objDoc.write("<style type='text/css'>");
	if (isIE)	objDoc.write("p { margin:0; word-break:break-all; }");
	else		objDoc.write("p { margin:0; white-space:-moz-pre-wrap; }");
	objDoc.write("body { font-family:'굴림'; font-size:9pt; overflow:auto; }");
	objDoc.write("table, td { font-family:'굴림'; font-size:9pt; }");
	objDoc.write("</style>");
	objDoc.write("</head><body bgcolor='#FFFFFF' style='margin:"+self.contentPadding+"px;'>"+self.decodeContents(self.orgTextarea.value)+"</body></html>");
	objDoc.close();
	objDoc.designMode = "on";

	self.objText.style.backgroundColor = self.config.textareaBgcolor;
	self.objText.style.padding = self.contentPadding+"px";
	self.objText.style.fontSize = "9pt";
	self.objText.style.fontFamily = "굴림";
	if (isIE)	self.objText.style.wordBreak = "break-all";
	else		self.objText.style.whiteSpace = "-moz-pre-wrap";

	addEvent(objCont, "blur", function () { wyditorClone(self); });
	addEvent(objCont.document, "keydown", function (event) { wyditorInterceptKey(event, self); });
	addEvent(self.objText, "blur", function () { wyditorClone(self); });
	addEvent(objDoc, 'click', hideLayer);

	return true;
};

wyditor.prototype.getContent = function() {
	var self = this;
	wyditorClone(self);
	return (self.objIfrm.style.display!='none' ? self.objIfrm.contentWindow.document.body.innerHTML : self.objText.value);
};

wyditor.prototype.setContent = function(value) {
	var self = this;
	self.objIfrm.contentWindow.document.body.innerHTML = value;
	self.objText.value = value;
	wyditorClone(self);
};

wyditor.prototype.decodeContents = function(value) {
//	value = value.replace(/&lt;/gi, "<");
//	value = value.replace(/&gt;/gi, ">");
//	value = value.replace(/&amp;/gi, "&");
	return value;
};

wyditor.prototype.changeEditorMode = function() {
	var self = this;

	var objButtonHtml = document.getElementById(self.textareaName+"_html");

	if (self.objIfrm.style.display != 'none') {
		try {
			self.objText.value = self.objIfrm.contentWindow.document.body.innerHTML;
			self.objIfrm.style.display = 'none';
			self.objText.style.display = 'inline';
			self.objText.focus();
		}
		catch (e) {}

		var arrToolBtn = document.getElementById(self.textareaName+"_toolbarButtons").childNodes;
		for (var i=0, len=arrToolBtn.length; i<len; i++) {
			if (arrToolBtn[i].title) {
				if (isIE) arrToolBtn[i].style.filter = "alpha(opacity=40)";
				else arrToolBtn[i].style.opacity = "0.4";
				arrToolBtn[i].style.cursor = "";
			}
		}

		if (isIE)	this.objButtonHtml.style.filter = "";
		else		this.objButtonHtml.style.opacity = "";
		objButtonHtml.setAttribute("title", "에디터보기");
	}
	else {
		try {
			self.objIfrm.contentWindow.document.body.innerHTML = self.objText.value;
			self.objText.style.display = 'none';
			self.objIfrm.style.display = 'inline';
			self.objIfrm.contentWindow.focus();
		}
		catch (e) {}

		var arrToolBtn = document.getElementById(self.textareaName+"_toolbarButtons").childNodes;
		for (var i=0, len=arrToolBtn.length; i<len; i++) {
			if (arrToolBtn[i].title) {
				if (isIE) arrToolBtn[i].style.filter = "";
				else arrToolBtn[i].style.opacity = "";
				arrToolBtn[i].style.cursor = "pointer";
			}
		}

		if (isIE)	this.objButtonHtml.style.filter = "alpha(opacity=60)";
		else		this.objButtonHtml.style.opacity = "0.6";
		objButtonHtml.setAttribute("title", "소스보기");
	}
	wyditorClone(self);
};

wyditor.prototype.eventHandler = function (objButton) {
	var self = this;
	var action = objButton.getAttribute("action");

	if (self.objIfrm.style.display == 'none') return false;

	self.objIfrm.contentWindow.focus();

	if (isIE) {
		self.objIfrm.selection = self.objIfrm.contentWindow.document.selection;
		self.objIfrm.range = self.objIfrm.selection.createRange();
	}
	else {
		self.objIfrm.selection = self.objIfrm.contentWindow.getSelection();
		self.objIfrm.range = self.objIfrm.selection.getRangeAt(0);
	}
	wyditorCurIframe = self.objIfrm;
	wyditorCurAction = action;

	hideLayer();

	switch (action) {
		case "fontname":
		case "fontsize":
		case "forecolor":
		case "backcolor":
		case "link":
			displayLayer(action, objButton, self.objIfrm);
			break;
		case "image":
			openWyditorPopup(wyditorPath+"/pop_attach.asp?mode=img&id="+self.textareaName+"&path="+self.config.uploadPath+"&rnd="+Math.random(), "WyditorUpload", 500, 291);
			break;
		case "multimedia":
			openWyditorPopup(wyditorPath+"/pop_medialink.asp?id="+self.textareaName+"&rnd="+Math.random(), "WyditorMediaLink", 400, 245, "scrollbars=yes");
			break;
		case "preview":
			var width = (self.widthUnit == '%') ? 700 : self.orgTextareaWidth;
			openWyditorPreview(self, width);
			break;
		default:
			try {
				self.objIfrm.contentWindow.document.execCommand(action, false, null);
			} catch (e) {}
	}
	return true;
};

wyditor.prototype.addLink = function (url) {
	var self = this;
	var html = "";

	try {
		if (url.indexOf("<") >= 0) {
			alert("허용하지 않는 링크주소입니다");
			return;
		}

		var ext = url.slice(url.lastIndexOf(".")+1).toLowerCase();
		var rnd = parseInt(Math.random() * 100000, 10);

		url = url.replace(/'/g, "\'");

		if  (ext == "gif" || ext == "jpg" || ext == "png" || ext == "bmp") {
			html = "<img class=\"wyditor_img\" src=\""+url+"\" border=\"0\">";
		}
		else if (ext == "avi" || ext == "wma" || ext == "wmv" || ext == "asf" || ext == "asx" || ext == "swf") {
			html = "<embed autostart=\"true\" src=\""+url+"\" style=\"width:300px; height:340px;\">";
		}
		else if (ext == "mp3") {
			html = "<embed autostart=\"true\" src=\""+url+"\">";
		}
		//2015-03-04 Ho Sik, Kang : youtube Link 추가
		else if ((/youtu/).test(url)) {
			url=url.replace("youtu.be","youtube.com/embed");
			html = "<embed autostart=\"true\" src=\""+url+"\" width=\"560\" height=\"349\">";
		}
		else {
			html = url;
		}

		html += "<br/>";

		self.objIfrm.contentWindow.focus();

		if (isIE) {
			self.objIfrm.contentWindow.document.selection.createRange().pasteHTML(html);
		}
		else {
			if (isIE11){
				var doc = self.objIfrm.contentWindow.document;
				//2015-10-27 Ho Sik, Kang : 다중이미지 업로드 시 순서 바뀜방지
				//var range = doc.getSelection().getRangeAt(0);
				var sel = doc.getSelection();
				var range = doc.createRange();
				var p = doc.body.appendChild(doc.createElement('p'));
				range.selectNode(p);
				sel.addRange(range);

				var nnode = doc.createElement('b');
				nnode.innerHTML = html;
				range.insertNode(nnode.firstChild);
				nnode = null;

				//2015-10-27 Ho Sik, Kang : 다중이미지 업로드 시 순서 바뀜방지
				doc.body.removeChild(p);
//				range.surroundContents(nnode);
//				nnode.innerHTML = html;

			}else{
				self.objIfrm.contentWindow.document.execCommand("InsertHTML", false, html);
			}
		}
	}
	catch(e) {}

	self.objIfrm.contentWindow.focus();
};
