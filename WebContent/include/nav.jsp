<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/Session.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <style>
   li{
      list-style:none;
   }
   </style>
<!-- topmenu -->
<ul>
                        <li><a href="/dahaejo/main/main.jsp">홈</a></li>
                        <li>
                           <a href="#">부품 카테고리</a>
                           <ul>
                              <li><a href="/dahaejo/category/cpu.jsp">CPU</a></li>
                              <li><a href="/dahaejo/category/mainboard.jsp">Mainboard</a></li>
                              <li><a href="/dahaejo/category/memory.jsp">Memory</a></li>
                              <li><a href="/dahaejo/category/gpu.jsp">Graphic Card</a></li>
                              <li><a href="/dahaejo/category/power.jsp">Power</a></li>
                              <li><a href="/dahaejo/category/ssdhdd.jsp">SSD, HDD</a></li>
                           </ul>
                        </li>
                        <li><a href="/dahaejo/board/qnaBoard/qnaList.jsp">질문게시판</a></li>
                        <li><a href="/dahaejo/board/oneOnOneBoard/oneOnOneList.jsp">1:1문의</a></li>
                        <li><a href="/dahaejo/board/adminBoard/adminList.jsp">공지사항</a></li>
                         <%
                              if(SESSION == null){
                              %>
                               <li><a href="/dahaejo/login/login.jsp">로그인</a></li>
                               <%
                              }else{
                              %>
                              <li><a href="/dahaejo/login/logout.jsp"><%=SESSION %>님 로그아웃</a></li>
                              <%
                              }
                              %>

                        

</ul>

</body>
</html>