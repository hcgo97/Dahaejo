<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>
<%
String unq = request.getParameter("unq");
String name = request.getParameter("name");
String userid = (String)session.getAttribute("SessionId");
%>


<%
if( unq == null || unq.equals("") ) {
%>
	<script>
	alert("잘못된 접근입니다.");
	history.back(); // 이전화면
	</script>
<%
	return;  // jsp 종료
}
%>


<%
String sql = " select title,content from adminboard "
		   + "   where unq='"+unq+"'  ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String content = rs.getString("content");
%>


<!doctype html>
<html>
<head>
<title>DahaeJo</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../include/assets/css/main.css" />
</head>

<script>
function fn_submit() {
	var f = document.frm;
	
	if( f.title.value == "" ) {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	if( f.content.value == "" ) {
		alert("내용을 입력해주세요.");
		f.content.focus();
		return false;
	}
	document.frm.submit();
}

</script>

<body class="homepage is-preload">

	<%
	if( userid == null || !userid.equals("admin")) {
	%>
		<script>
		alert("관리자만 접근가능합니다.");	
		location = "/dahaejo/board/adminBoard/adminList.jsp";
		</script>
	<%
	}else{
	%>
	
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../../include/nav.jsp"%>
				
<table border="0" width="600" align="center">
	<tr>
		<th> 공지게시판 글수정 </th>
	</tr>
</table>

<br>

<form name="frm" method="post" action="adminModifySave.jsp">

<input type="hidden" name="unq" value="<%=unq %>">

<table border="1" width="600" align="center" style="border-collapse:collapse; border: 1px solid black;">
	<tr>
		<th>제목</th>
		<td align="left"><input type="text" name="title" value="<%=title %>"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td align="left">
		<textarea name="content" rows="5" cols="50"><%=content %></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit" style="cursor:pointer" onclick="fn_submit();return false;">저장</button>
		<button type="button" style="cursor:pointer" onclick="history.back(-1);">취소</button>
		</th>
	</tr>
</table>
</form>

<%
}
%>
			</nav>
		</div>
	</div>
		<!-- Scripts -->
	<script src="/dahaejo/include/assets/js/jquery.min.js"></script>
	<script src="/dahaejo/include/assets/js/jquery.dropotron.min.js"></script>
	<script src="/dahaejo/include/assets/js/jquery.scrolly.min.js"></script>
	<script src="/dahaejo/include/assets/js/jquery.scrollex.min.js"></script>
	<script src="/dahaejo/include/assets/js/browser.min.js"></script>
	<script src="/dahaejo/include/assets/js/breakpoints.min.js"></script>
	<script src="/dahaejo/include/assets/js/util.js"></script>
	<script src="/dahaejo/include/assets/js/main.js"></script>
 </body>
</html>






    