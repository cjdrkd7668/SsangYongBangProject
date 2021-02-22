<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<style>

  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: black;
  }
  
  .sidebar-nav li a:hover {
    color: #999;
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>


  <!-- 사이드바 -->
 <!-- <div id="sidebar-wrapper"> --> 
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="/sybang/service/servicemain.do">청소 & 시공</a>
      </li>
      <li><a href="/sybang/service/servicemypage.do">마이 서비스</a></li>
      <li><a href="/sybang/request/requestlist.do">요청서 리스트</a></li>
      <li><a href="/sybang/servicereview/servicereview.do">후기 리스트</a></li>
      <li><a href="/sybang/servicechat/servicechat.do">1:1 문의</a></li>
      <li><a href="/sybang/servicescheduler/servicescheduler.do">일정 관리</a></li>
      <c:if test="${not empty email}"> <!-- 업주 이메일로 로그인시 보이는 사이드메뉴 -->
      <li><a href="/sybang/request/receivedrequestlist.do">받은 견적서 리스트</a></li>
      </c:if>
    
    </ul>
  <!-- </div> -->
  <!-- /사이드바 -->

