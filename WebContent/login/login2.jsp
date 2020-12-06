<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" type="text/css" 
                    href="../CSS/layout.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />

</head>

<Style>
th,td{
	padding = 5px;
}
td{
	text-align=left;
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
	f.submit();
}
</script>


<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../include/nav.jsp" %>


	<%
		if(SESSION == null){
	%>
<form name= "frm" method="post" action="loginProc.jsp">		
		<table border="0" align="center" width = "600">
			<caption><h1>로그인 </h1></caption>
			<colgroup>
				<col width="30%"/>
				<col width="70%"/>
			</colgroup>
		
			<tr>
				<th height=50><label for="userid" style="width:850px;height:50px;font-size:30px;">아이디<span style="color:red;">*</span></label></th>
				<td><input type="text" name="userid" id="userid" style="width:600px;height:50px;font-size:30px;" placeholder="아이디입력">
				</td>
			</tr>
			<tr>
				<th height=50><label for="pass" style="width:850px;height:50px;font-size:30px;">비밀번호<span style="color:red;">*</span></label></th>
				<td><input type="password" name="pass" id="pass" style="width:600px;height:50px;font-size:30px;" placeholder="비밀번호입력"></td>
			</tr>
			
			<tr>
				<th colspan="2" align = "center"><span style="color:red;"><font size ="2px">잘못된 아이디이거나 비밀번호입니다.</font><span style="color:red;"></th>
			</tr>
			
			<tr>
				<th colspan="2">
				<button type="submit" onclick="fn_submit();return false;" style="width:150px;height:45px;font-size:15px;">로그인</button>
				<input type="button" name="test"  value="아이디찾기" style="width:150px;height:45px;font-size:15px;" onclick="location='findIdForm.jsp'">
				<input type="button" name="test"  value="비밀번호찾기" style="width:150px;height:45px;font-size:15px;" onclick="location='findPassForm.jsp'">
				<input type="button" name="signup"  value="회원가입" style="width:150px;height:45px;font-size:15px;" onclick="location='memberWrite.jsp'">
				</th>
			</tr>
			<%
			}else{
			%>
			
			<form name= "frm" method="post" action="logout.jsp">		
				<table border="0" align="center" width = "600">
					<caption><h1>로그인 </h1></caption>
					<colgroup>
						<col width="30%"/>
						<col width="70%"/>
					</colgroup>
				
					<tr>
						<%=SESSION %>
					</tr>
					
					<tr>
						<th colspan="2">
						<button type="submit" onclick="fn_submit();return false;">로그아웃</button>
					    </th>
				    </tr>
				 </table>
				 <%
				 }
				 %>
				</table>
		</form>
		
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
				