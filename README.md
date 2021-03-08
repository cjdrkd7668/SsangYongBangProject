쌍용방 프로젝트
=============
Servlet을 사용한 JSP MODEL 2 웹 사이트 프로젝트
-------------

### 개발환경

* 사용 언어
  * Java, JDK 1.8.0_221
* 개발 도구
  * Eclipse IDE for Enterprise Java Developers
  * Visual Studio Code Version 1.41
  * Oracle SQL Developer
  * DBeaver
* 미들웨어 솔루션
  * DB : Oracle DataBase
  * WAS : Apache Tomcat 8.5v
* UI 설계 도구 : Balsamiq Wireframes 4.1.12
* 형상 관리 도구 : Github Desktop

<hr>

### 목적
1. 방을 내놓고, 부동산을 등록하거나 검색하는 기능과 이사 시 필요한 서비스(청소, 시공)를 통합적으로 제공
2. 부동산 중개사와 서비스 업체를 위한 소비자 실 수요 파악 및 일정 관리 시스템 지원

<hr>

### 주요 구동 화면
##### 사이트 메인 화면
> <p>사용자가 처음 사이트에 접근했을 때 볼 수 있는 화면으로, 게시된 매물이나 공지사항, <br> 
> 뉴스를 간략히 보거나 헤더를 통해 각종 기능에 접근하거나 로그인 할 수 있습니다.</p>
<img src="/images/main.png" width="80%" height="80%" alt="Main"></img>
##### 방찾기 화면
> <p>사용자가 방 찾기 메뉴에 접근했을 때 볼 수 있는 화면으로, 조건을 나타내는 버튼을 눌러 <br> 
> 선택할 때마다 조건에 부합한 매물의 위치를 마커로 지도 상에 띄워줍니다.</p>
<img src="/images/finder.png" width="80%" height="80%" alt="finder"></img>
##### 특정 방(매물) 상세 화면
> <p>방 찾기 메뉴에서 특정 매물의 마커 클릭 시 나타나는 인포 위도우의 링크를 눌렀을 떄 볼 수 있는 화면으로, <br>
> 매물의 상세 정보를 확인할 수 있고, 매물의 이미지를 슬라이드로 넘겨가며 볼 수 있습니다.</p>
<img src="/images/detail.png" width="80%" height="80%" alt="detail"></img>
##### 관리자의 사용자 관리 화면
> <p>관리자 메뉴에서 좌측 사이드 바의 사용자 관리 메뉴에 접근했을 때 볼 수 있는 화면으로, <br>
> 사이트에 가입된 사용자의 정보를 목록으로 조회하고, 특정 사용자 페이지로 진입해 수정할 수 있습니다.</p>
<img src="/images/admin.png" width="80%" height="80%" alt="admin"></img>
##### 회원/중개사의 댓글 수정 화면
> <p>커뮤니티 탭의 하위 메뉴인 자유 게시판에서 특정 글에 접근했을 때 볼 수 있는 화면으로, <br>
> 다른 사람의 댓글을 볼 수 있고, 직접 댓글을 작성하거나 내가 쓴 댓글을 수정하거나 삭제할 수 있습니다.</p>
<img src="/images/comment.png" width="80%" height="80%" alt="comment"></img>
##### 서비스 업체와 고객 간의 문의 화면
> <p>회원(고객)의 요청서에 의해 서비스 업체가 제시한 견적서를 채택한 고객과의 1:1 온라인 상담 화면으로, <br>
> 서비스 업체와 고객이 메신저의 형태로 상담을 할 수 있고, 이를 기록하여 필요할 때 대화 내용을 조회할 수 있다. </p>
<img src="/images/messenger.JPG" width="80%" height="80%" alt="messenger"></img>
##### 서비스 업체의 일정 스케줄러 화면
> <p>서비스 업체의 서비스 일정/진행내역/견적서 등을 일괄등록할 수 있는 스케줄러의 화면으로, <br>
> 서비스를 이용한 고객의 정보도 조회할 수 있고, 이용한 서비스에 대한 일정, 정보를 확인할 수 있다.</p>
<img src="/images/scheduler.JPG" width="80%" height="80%" alt="scheduler"></img>

<hr>

### 담당 업무
|분류|담당한 업무(요약)|
|---|---|
|공통|기획서 작성, 요구사항 분석서 작성, ERD 설계, 순서도 작성, 더미데이터 생성, SQL DDL 작성, HTML5/CSS/JavaScript 작성, JAVA/JDBC/SERVLET/JSP/AJAX 활용 기능 구현|
|이청강|SQL View, DML(프로시저) 작성, 방 찾기, 방 내놓기 및 관리자 페이지 구현, 그룹웨어 제안 자료, 발표 자료 작성|
|김소리|Balsamiq Wireframes을 활용한 화면 설계(Mock-up), 서비스 업체 페이지 구현|
|이찬미|SQL View, DML(프로시저) 작성, [메인화면], [관리자] 매물 관리, [중개사] 방 조회/매물 등록, 내가 등록한 매물 조회, [회원] 마이페이지, 회원가입/탈퇴/수정, [관리자/중개사/회원] 자유게시판, 문의게시판, 공지사항 CRUD|
|임채원|Balsamiq Wireframes을 활용한 화면 설계(Mock-up), 관리자 페이지 구현|
|황원준|Balsamiq Wireframes을 활용한 화면 설계(Mock-up), 중개사 페이지 구현|

<hr>
