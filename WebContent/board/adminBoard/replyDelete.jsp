<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>
<%
String userid = (String) session.getAttribute("SessionId");
String replyunq = request.getParameter("replyunq");
String replyer = request.getParameter("replyer");

request.setCharacterEncoding("UTF-8");


//로그인 안되있거나 로그인된 아이디 != 댓글작성자 일경우
if(userid == null) {
	%>
	
	<script>
		alert("로그인해주세요.");
		history.back();
	</script>
	
<%

} else if (userid.equals(replyer) || userid.equals("admin")){
	
	String sql2 = " delete from admin_reply  where replyunq='"+replyunq+"' ";
	stmt.executeUpdate(sql2);
	%>
	<script>
	alert("댓글이 삭제되었습니다.");
	window.location = document.referrer;
	</script>

<%
} else{
	%>
	
	<script>
		alert("삭제할 권한이 없습니다.");
		history.back();
	</script>
	
<%
}
%>

