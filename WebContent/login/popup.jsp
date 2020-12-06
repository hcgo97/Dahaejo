<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" type="text/css" 
                    href="../CSS/layout.css" />
  <meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />
</head>

<script>


function popup() {
	var url = "login.jsp";
	var name = "popup test";
	var option = "width = 500, height = 500"
	window.open(url,name,option);	
}
</script>

<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../../include/nav.jsp"%>
<a href = "javascript:popup()">로그인</a>
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