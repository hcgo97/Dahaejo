<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>    
<%
String userid = (String)session.getAttribute("SessionId");
String title = request.getParameter("title");
String name = request.getParameter("name");
String content = request.getParameter("content");


String sql = " insert into oneonone "
	       + " ( unq,title,name,content,rdate,gid,insort) "
	       + " values "
	       + " ( oneonone_seq.nextval,'"+title+"','"+userid+"','"+content+"', sysdate ,"
	       + "   (select nvl(max(gid),0)+1 from oneonone) ,'a')";

int result = stmt.executeUpdate(sql);
if( result > 0 ) {
%>
	<script>
	alert("글이 작성되었습니다.");
	location.href = "oneOnOneList.jsp";
	</script>
<%
}
%>
