<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>
<%
String userid = (String)session.getAttribute("SessionId");
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String content = request.getParameter("content");


String sql = " update qnaboard set "
		   + " 		title='"+title+"', "
		   + " 		content='"+content+"' "
		   + " where unq='"+unq+"' ";
stmt.executeUpdate(sql);
%>
<script>
alert("글이 수정되었습니다.");
location = "qnaList.jsp";
</script>

