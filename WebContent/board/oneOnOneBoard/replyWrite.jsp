<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String gid = request.getParameter("gid"); //넘어온값 그대로저장
String insort = request.getParameter("insort"); //저장될때마다 영어 하나씩 더붙이기
String userid = (String)session.getAttribute("SessionId");

if( userid == null || !userid.equals("admin") ) {
%>
	<script>
	alert("관리자만 접근할 수 있습니다.");	
	location = "/dahaejo/board/oneOnOneBoard/oneOnOneList.jsp"
	</script>
<%

}

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
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../../include/nav.jsp"%>
			
<br> <br> <br>

<table border="0" width="600" align="center">
	<tr>
		<th> 1:1문의 답변작성 </th>
	</tr>
</table>

<br>

<form name="frm" method="post" action="replyWriteSave.jsp">

	<input type = "hidden" name ="gid" value= "<%=gid %>" id = "<%=gid %>">
	<input type = "hidden" name ="insort"  value="<%=insort %>" id = "<%=insort %>">
	
	<table border="1" width="600" align="center" style="border-collapse:collapse; border: 1px solid black;">
		<tr>
			<th>제목</th>
			<td align="left"><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td align="left">
			<textarea name="content" rows="5" cols="50" placeholder="내용 입력"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
			<button type="submit" style="cursor:pointer" onclick="fn_submit();return false;">저장</button>
			<button type="reset" style="cursor:pointer">취소</button>
			</th>
		</tr>
	</table>
</form>

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






    