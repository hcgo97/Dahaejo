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
// 조회수 증가 -> hits
String sqlUpdate = " update adminboard set hits=hits+1 "
				 + "  where unq='"+unq+"' " ;
stmt.executeUpdate(sqlUpdate);

String sql = " select title,to_char(rdate,'yyyy-mm-dd') as rdate,hits,content,gid,insort from adminboard "
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
<title>공지사항 <%=title %></title>
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
						
						<button type="button" style="cursor:pointer" onclick=" location='adminModify.jsp?unq=<%=unq %>&name=<%=name %>'">수정하기</button>
						<button type="button" style="cursor:pointer" onclick=" location='adminDelete.jsp?unq=<%=unq %>&name=<%=name %>&gubun=2'">삭제하기</button>
						
						</th>
					</tr>
				</table>
				
				<br>
				
				
				
				<!-- 댓글 -->
				
				<!-- 댓글 쿼리 -->
				<%
				String board_unq = request.getParameter("unq");
				
				if( board_unq == null || board_unq.equals("") ) {
				   return;  // jsp 종료
				}
				
				
				String sql2 = " select replyer,replytext,to_char(redate,'yy-mm-dd hh24:mi') redate,replyunq from admin_reply "
				         + "   where board_unq='"+board_unq+"' "
				         + "      order by replyunq ";
				
				ResultSet rs2 = stmt.executeQuery(sql2);
				%>
				
				<div class="reply">
				<table align = "center" border="0" width="600" id = "reply_area">
				<colgroup>
				   <col width="10%">
				   <col width="60%">
				   <col width="20%">
				   <col width="10%">
				</colgroup>
				   <%
				   while(rs2.next() ) {
				
				   int replyunq = rs2.getInt("replyunq");
				   String replytext = rs2.getString("replytext");
				   String replyer = rs2.getString("replyer");
				   String redate = rs2.getString("redate");
				   replytext = replytext.replaceAll("\n","<br>");
				   replytext = replytext.replaceAll(" ","&nbsp;");
				
				/*
				   --> \n --> <br>
				   --> "        "  --> &nbsp;
				*/
				   %>
				
				   <tr>
				      <th align="center" style="width:70px;"><%=replyer %></th>
				
				      <td align="left" style="width:340px;"><%=replytext %></td>
				
				      <td align="center" style="width:100px;"><%=redate %></td>
				      
				      <td align = "center"><button type="button"
				      						onclick="location='replyDelete.jsp?replyunq=<%=replyunq %>&replyer=<%=replyer %>'">삭제</button></td>      
				   </tr>
				
				</div>
				   <%
				   }
				   %>
				</table>
				
				<form id="replyform" method="post" action="replySave.jsp">
				    <input type="hidden" id="unq" name="unq" value="<%=unq %>"/>
				    <input type="hidden" id="userid" name = "userid" value = "<%=userid %>"/>
				   <table align = "center" border="0" width="600" >
				         <tr>
				                   <td>
				                        <input type="text" id="replytext" name="replytext" style="width:520px; height:40px;  margin-left:550px;" placeholder="댓글을 입력하세요."/>
				                    </td>
				                    
				                    <td>
				                        <button type = "submit" id="reply_save" name="reply_save" align = "center"  style="margin-right:600px;"  style="margin-right:600px;"onclick="fn_replysubmit();return false;">등록</button>
				                    </td>
				
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






    