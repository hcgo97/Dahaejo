<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp"%>
<%
String unq = request.getParameter("unq");
String name = request.getParameter("name");
String userid = (String)session.getAttribute("SessionId");

	if ( unq == null || unq.equals("") ) {
	%>
	<script>
		alert("잘못된 접근입니다.");
		history.back();
	</script>
	<%
		return;
	}
	%>

<%
//로그인 안되있거나
if(userid == null) {
%>

	<script>
		alert("로그인해주세요.");
		history.back();
	</script>

<%
}else if(userid == "admin" || userid.equals("admin") || userid.equals(name) ){

	String sql = " select count(*) over() cnt, gid, insort from qnaboard "
			   + "   where unq='"+unq+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	
	int cnt = 0;
	int gid = 0;
	String insort = "";
	
	if(rs.next()) {
		cnt = rs.getInt("cnt");
		gid = rs.getInt("gid"); 
		insort = rs.getString("insort");
	}
	%>
	
	
	<%
	String sql2 = " select count(*) cnt2 from qnaboard  "
				+ "   where gid='"+gid+"' "
				+ "     and insort like '"+insort+"_' ";
	
	ResultSet rs2 = stmt.executeQuery(sql2);
	rs2.next();
	int cnt2 = rs2.getInt("cnt2");
	
	String sql3 = "";
	
	if( cnt2 == 0 ) {
		sql3 = " delete from qnaboard where unq='"+unq+"'  ";
	} else {
		sql3 = " update qnaboard set title='삭제된 글',content='' "
			 + "  where  unq='"+unq+"' ";
	}
	stmt.executeUpdate(sql3);
	
	%>
	<script>
		alert("글이 삭제되었습니다.");
		location = "qnaList.jsp";
	</script>
	
<%
}else if(!userid.equals(name) ) {  //로그인된 아이디 != 글작성자 일경우
%>

	<script>
		alert("삭제할 권한이 없습니다.");
		history.back();
	</script>
<%
}
%>