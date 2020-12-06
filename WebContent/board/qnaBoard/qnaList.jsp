<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>

<%
String userid = (String)session.getAttribute("SessionId");
if(userid == null) {
	userid = "";
}

int unit = 7;

String page1 = request.getParameter("page");
if ( page1 == null || page1.equals("") ) {
	page1 = "1";
}
int viewPage = Integer.parseInt(page1);

// viewPage : 1-1 * 10 + 1 => 1,10
// viewPage : 2-1 * 10 + 1 => 11,20
// viewPage : 3-1 * 10 + 1 => 21,30
//   endIdx => startIdx + (10-1)
int startIdx = (viewPage - 1) * unit + 1 ;
int endIdx = startIdx + (unit-1);
%>

<%
String sqlTot = "select count(*) total from qnaboard";
ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total");

//  1 page ->  total -  0;  
//  2 page ->  total - 10; (viewPage - 1 * 10)
//  3 page ->  total - 20;
//  4 page ->  total - 30 ;

int number = total - ( (viewPage - 1) * unit );

/*
(double)19/10 -> 1.9 -> Math.ceil(1.9) -> (int)2.0 -> 2
*/
int lastpage = (int) Math.ceil((double)total/unit);

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
<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Nav.jsp -->
			<!-- 상단 메뉴bar -->
			<nav id="nav">
				<%@ include file="../../include/nav.jsp"%>

	<br><br>
<table border="0" width="600" align="center">
	<tr>
		<th> 질문게시판 </th>
	</tr>
</table>
<br>
<table border="0" width="1000" align="center">
	<tr>
		<td align="right">
			<button type="button" style="cursor:pointer" onclick="location='qnaWrite.jsp'">글쓰기</button>
		</td>
	</tr>
</table>

<table border="1" width="1000" align="center" style="border-collapse:collapse; border: 1px solid black;">
	<colgroup>
		<col width="15%"/>
		<col width="40%"/>
		<col width="15%"/>
		<col width="15%"/>
		<col width="15%"/>
	</colgroup>
	<tr>
		<th style="padding:10px 10px 10px 10px 10px;">번호</th>
		<th style="padding:10px 10px 10px 10px 10px;">제목</th>
		<th style="padding:10px 10px 10px 10px 10px;">작성자</th>
		<th style="padding:10px 10px 10px 10px 10px;">조회수</th>
		<th style="padding:10px 10px 10px 10px 10px;">등록일</th>
	</tr>
	
	<%
	//관리자글띄우기
	String adminSQL =	" select * from " +
						"	 (select unq,title,name,hits, " +
						"		 to_char(rdate,'yyyy-mm-dd') rdate from adminboard " +
						"			 order by unq desc) " +
						" where rownum <= 3 ";
			   
	ResultSet rs_admin = stmt.executeQuery(adminSQL);
	
	while( rs_admin.next() ) {
		int unq = rs_admin.getInt("unq");
		String title = rs_admin.getString("title");
		String name = rs_admin.getString("name");
		int hits = rs_admin.getInt("hits");
		String rdate = rs_admin.getString("rdate");
	%>
		<tr>
			<td align="center" bgcolor="yellow" style="padding:10px 10px 10px 10px 10px; color:black; "><b>공지사항</b></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;">
			<a href="../adminBoard/adminDetail.jsp?unq=<%=unq %>&name=<%=name %>"><%=title %></a>
			</td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=name %></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=hits %></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=rdate %></td>
		</tr>
	<%
	}
	%>
	
	<%
	String sql = "  select b.* from  ( "
			   + "		select rownum rn, a.* from " 
			   + "		( select unq,title,name,hits, "
			   + " 			to_char(rdate,'yyyy-mm-dd') rdate, "
			   + "				(select count(*) from qna_reply where board_unq = b.unq) as total "
			   + "				from qnaboard b"
			   + "		        order by unq desc   ) a  ) b "
			   + "  where rn >= "+startIdx+" and rn <= "+endIdx ;
			   
	ResultSet rs = stmt.executeQuery(sql);
	
	while( rs.next() ) {
		int unq = rs.getInt("unq");
		String title = rs.getString("title");
		String name = rs.getString("name");
		int hits = rs.getInt("hits");
		String rdate = rs.getString("rdate");
		int replyCnt = rs.getInt("total");
	%>
		<tr>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=number %></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;">
			<a href="qnaDetail.jsp?unq=<%=unq %>&name=<%=name %>"><%=title %>
			
			<%
			if(replyCnt > 0) { //댓글수 1개부터 표시
			%>
			
			(<%=replyCnt %>)
			
			<%
			}
			%>
			
			</a></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=name %></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=hits %></td>
			<td align="center" style="padding:10px 10px 10px 10px 10px;"><%=rdate %></td>
		</tr>
	<%
		number--;  // 1가감 처리
	}
	%>
</table>

<table border="0" width="600" align="center">
	<tr>
		<td align="center">
		
		<%
		for( int i=1; i<=lastpage; i++ ) {
		%>
			  <a href="qnaList.jsp?page=<%=i %>"><%=i %></a>
		<%
		}
		%>

		</td>
	</tr>
</table>

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

    