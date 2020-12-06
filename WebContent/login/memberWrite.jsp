<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />
</head>

<Style>
th, td {padding = 5px;
	
}

td {text-align =left;
	
}
</Style>

<script>

function fn_idcheck(){
	var userid = document.frm.userid.value;
	if(userid == ""){
		alert("아이디를입력해주세요.");
		document.frm.userid.focus();
		return false;
	}
	
	var url = "idcheck.jsp?userid="+userid;
	window.open(url,"aa","witdh=300,height=150");
}

function fn_submit(){
	var f = document.frm;
	
	if(f.userid.value.length < 4 || f.userid.value.length > 12){
		alert("아이디는4자~12자 사이로 입력해주세요.");
		f.userid.focus();
		return false;
	}
	if(f.pass.value == ""){
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	if(f.pass.value != f.passcheck.value){
		alert("암호가 같지 않습니다.");
		f.pass.focus();
		return false;	
	}
	if(f.name.value == ""){
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if(f.email.value == ""){
		alert("이메일을 입력해주세요.");
		f.email.focus();
		return false;
	}
	f.submit();
}
</script>

<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../include/nav.jsp"%>

				<br> <br> <br>
				<caption padding-left="100px">
					<span style="color: red;">*</span>표시는 필수입력입니다.
				</caption>
				
				
				<form name="frm" method="post" action="memberWriteSave.jsp">

					<table border="1" style=margin-left:500px>

						<colgroup>
							<col width="10%" />
							<col width="10%" />
						</colgroup>

						<tr>
							<td align = "center">아이디<span style="color: red;">*</span></td>
							<td align = "center"><input type="text" name="userid" id="userid" placeholder="4~12자 이내" style="width:300px;height:30px;"></td>
							<td><button type="button" onclick="fn_idcheck()">중복체크</button></td>
							<td><onclick="fn_idcheck()" style=margin-left:500px>중복체크2</button></td>
							<td><onclick="fn_idcheck()">중복체크3</button></td>
						</tr>
						<tr align = "center">
							<td align = "center">비밀번호<span style="color: red;">*</span></td>
							<td align = "center"><input type="password" name="pass" id="pass" placeholder="비밀번호 입력" style="width:300px;height:30px;"></td>
						</tr>
						<tr align = "center">
							<td align = "center">비밀번호 확인<span style="color: red;">*</span></td>
							<td align = "center"><input type="password" name="passcheck" id="passcheck" placeholder="비밀번호 확인" style="width:300px;height:30px;"></td>
						</tr>
						<tr align = "center">
							<td align = "center">이름<span style="color: red;">*</span></td>
							<td align = "center"><input type="text" name="name" id="name" style="width:300px;height:30px;"></td>
						</tr>
						<tr align = "center">
							<td align = "center">이메일<span style="color: red;">*</span></td>
							<td align = "center"><input type="text" name="email" id="email" style="width:300px;height:30px;"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" onclick="fn_submit();return false;">회원가입</button>
								<button type="reset">다시쓰기</button>
								<button type="button" name="back" onclick="location='login.jsp'">취소</button>

							</td>
						</tr>

						<tr>

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
