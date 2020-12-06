<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>game</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />
	<link rel="stylesheet" href="../include/assets/css/noscript.css" />
</head>


<script>
function fn_submit(){	
	var f = document.frm;
	
	if (f.price.value == "") {
		alert ("가격을 입력해주세요.");
		f.price.focus();
		return false;
	}
	
	if(f.price.value.length < 6 || f.price.value.length > 7){
		alert("100,000원 ~ 2,000,000원 사이의 가격대를 입력해주세요.");
		f.price.focus();
		return false;
	}
	
	if (f.price2.value == "") {
		alert ("가격을 입력해주세요.");
		f.price.focus();
		return false;
	}
	
	if(f.price2.value.length < 6 || f.price.value.length > 7){
		alert("100,000원 ~ 2,000,000원 사이의 가격대를 입력해주세요.");
		f.price.focus();
		return false;
	}
	
	f.submit();
}
</script>



<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="index.html" id="logo">DaHaeJo</a>
					</h1>
					<hr />
					<p>원하는 가격대를 입력해주세요.</p>
				</header>
				<footer>
				
				
				
					<form name = "frm" method = "post" action="search.jsp">
						<div class="input-group mb-3">
						
							<input type="text" name = "price" id = "price" style=text-align:center; width:130px;" class="form-control" placeholder="ex)100000" aria-label="Recipient's username" aria-describedby="button-addon2">
							<input type="text" name = "price2" id = "price2" style=text-align:center; width:130px;" class="form-control" placeholder="ex)100000" aria-label="Recipient's username" aria-describedby="button-addon2">
							<input type = "hidden" name = "kind" value = "롤">
							
							<div class="input-group-append">
							
								<button type="submit" onclick="fn_submit();return false;" class="btn btn-outline-secondary" id="button-addon2">검색</button>
								
							</div>
						</div>
					</form>
					
				</footer>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="../main/main.jsp">홈</a></li>
					<li>부품 카테고리
						<ul>
							<li><a href="/dahaejo/category/cpu.jsp">CPU</a></li>
							<li><a href="/dahaejo/category/mainboard.jsp">Mainboard</a></li>
							<li><a href="/dahaejo/category/memory.jsp">Memory</a></li>
							<li><a href="/dahaejo/category/gpu.jsp">Graphic Card</a></li>
							<li><a href="/dahaejo/category/power.jsp">Power</a></li>
							<li><a href="/dahaejo/category/ssdhdd.jsp">SSD, HDD</a></li>
						</ul></li>
					<li><a href="/dahaejo/board/qnaBoard/qnaList.jsp">질문답변 게시판</a></li>
					<li><a href="/dahaejo/board/oneOnOneBoard/oneOnOneList.jsp">1:1 문의</a></li>
					<li><a href="/dahaejo/board/adminBoard/adminList.jsp">공지게시판</a></li>
					<li><a href="#">로그인</a></li>
				</ul>
			</nav>

		</div>

	</div>

	<!-- Scripts -->
	<script src="../include/assets/js/jquery.min.js"></script>
	<script src="../include/assets/js/jquery.dropotron.min.js"></script>
	<script src="../include/assets/js/jquery.scrolly.min.js"></script>
	<script src="../include/assets/js/jquery.scrollex.min.js"></script>
	<script src="../include/assets/js/browser.min.js"></script>
	<script src="../include/assets/js/breakpoints.min.js"></script>
	<script src="../include/assets/js/util.js"></script>
	<script src="../include/assets/js/main.js"></script>

</body>
</html>