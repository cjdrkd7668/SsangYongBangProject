package com.test.sist.inc;
/** 
* 페이지바를 만드는 메서드를 프로젝트 전역에 활용하기 위해 만든 클래스입니다.
* @author 이청강 
*/
public class Pagination {

	//nowPage			//현재 페이지 번호
	//totalCount		//총 게시물 수
	//pageSize			//한페이지 당 출력 개수
	//blockSize			//페이지바 관련 변수
	//pathWithoutPage 	//page를 제외한, 페이지 이동 path (예: /sybang/admin/hope/boardlist.do)
	/** 
	* 현재 페이지 번호, 총 게시물 수, 한 페이지당 출력할 게시물 수, 페이지 바 크기, 페이지를 나타낼 경로를 매개변수로 받아서,
	* 페이지바에 해당하는 html태그를 반환하는 메서드입니다.
	* @param nowPage 현재 페이지 번호
	* @param totalCount 총 게시물 수
	* @param pageSize 한 페이지 당 출력할 게시물 수
	* @param blockSize 페이지 바 크기
	* @param pathWithoutPage page=?를 제외한 get방식 path
	* @return 페이지바에 해당하는 html태그
	*/
	public static String getPageBarTag(int nowPage, int totalCount, int pageSize, int blockSize, String pathWithoutPage) {
	
		String pageBar = "";
		if (pathWithoutPage.contains("?")) {			
			pathWithoutPage += "&";
		} else {
			pathWithoutPage += "?";
		}
		
		int totalPage = (int)Math.ceil((double)totalCount / pageSize);
		int loop = 1;
		int n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		if (n == 1) {
			pageBar += String.format("<li class='disabled'>"
					+ "            <a href=\"#!\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>");
		} else {				
			pageBar += String.format("<li>"
					+ "            <a href= \"" + pathWithoutPage + "page=%d\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>", n - 1);
		}
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (nowPage == n) {
				pageBar += "<li class='active'>";
			} else {
				pageBar += "<li>";
			}
			
			pageBar += String.format("<a href=\"" + pathWithoutPage + "page=%d\">%d</a></li>", n, n);
			
			loop++;
			n++;
		}
		
		if (n > totalPage) {
			pageBar += String.format("<li class='disabled'>"
					+ "            <a href=\"#!\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>");
		} else {
			pageBar += String.format("<li>"
					+ "            <a href=\"" + pathWithoutPage + "page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
		}
		
		return pageBar;
		
	};
	
}















