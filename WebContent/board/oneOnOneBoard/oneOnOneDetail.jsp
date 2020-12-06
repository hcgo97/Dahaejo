<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>

<%
String unq = request.getParameter("unq");
String name = request.getParameter("name");
String userid = (String)session.getAttribute("SessionId");

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
if(userid == null) {
%>
	<script>
	alert("로그인 후 다시 시도해주세요.");
	location='/dahaejo/login/login.jsp';
	</script>
<%

}else if(userid == "admin" || userid.equals("admin") || userid.equals(name) ){


// 조회수 증가 -> hits
String sqlUpdate = " update oneonone set hits=hits+1 "
				 + "  where unq='"+unq+"' " ;
stmt.executeUpdate(sqlUpdate);

String sql = " select title,to_char(rdate,'yyyy-mm-dd') as rdate,hits,content,gid,insort from oneonone "
		   + "   where unq='"+unq+"'  ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();


String title = rs.getString("title");
String rdate = rs.getString("rdate");
int hits = rs.getInt("hits");
String content = rs.getString("content");
String gid = rs.getString("gid");
String insort = rs.getString("insort");
content = content.replaceAll("\n","<br>");
content = content.replaceAll(" ","&nbsp;");

/*
   --> \n --> <br>
   --> "        "  --> &nbsp;
*/


%>


<!doctype html>
<html>
<head>
<title>1:1문의게시판 <%=title %></title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../include/assets/css/main.css" />
</head>


<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../../include/nav.jsp"%>

				<table border="1" width="600" align="center" style="border-collapse:collapse; border: 1px solid black;">
				<br> <br> <br>
					<tr>
						<th width="30%">제목</th>
						<td width="70%" align="left"><%=title %></td>
					</tr>
					<tr>
						<th width="30%">글쓴이</th>
						<td width="70%" align="left"><%=name %></td>
					</tr>
					<tr>
						<th width="30%">작성일자</th>
						<td width="70%" align="left"><%=rdate %></td>
					</tr>
					<tr>
						<th width="30%">조회수</th>
						<td width="70%" align="left"><%=hits %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td align="left"><%=content %></td>
					</tr>
					<tr>
						<th colspan="2">
						
						<button type="button" style="cursor:pointer" onclick=" location='oneOnOneModify.jsp?unq=<%=unq %>&name=<%=name %>'">수정하기</button>
						<button type="button" style="cursor:pointer" onclick=" location='oneOnOneDelete.jsp?unq=<%=unq %>&name=<%=name %>&gubun=2'">삭제하기</button>
						
						<%
						if(userid == "admin" || userid.equals("admin")) {
						%>
						<button type="button" style="cursor:pointer" onclick=" location='replyWrite.jsp?gid=<%=gid %>&insort=<%=insort %>' ">답변하기</button>	
						<%
						}
						%>
						
						</th>
					</tr>
				</table>

	<%
	} else if(!userid.equals(name)) {
	%>
	
	<script>
		alert("확인할 권한이 없습니다.");
		history.back();
	</script>
	
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






    