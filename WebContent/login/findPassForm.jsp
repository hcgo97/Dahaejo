<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기</title>
  <link rel="stylesheet" type="text/css" 
                    href="../CSS/layout.css" />
  <meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../../include/nav.jsp"%>


<form name="find" method="post" action="findPassFormSub.jsp">
<h1>비밀번호 찾기 페이지 입니다.</h1>
<b>아이디를 입력해주세요</b> : <input type="text" name="userid"/><br><br>
<input type="submit" value="아이디로 비밀번호 찾기"/><br>

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
</body>
</html>