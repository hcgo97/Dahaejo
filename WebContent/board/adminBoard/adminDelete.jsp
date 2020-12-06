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
	if( userid == null || !userid.equals("admin")) {
	%>
		<script>
		alert("관리자만 접근가능합니다.");	
		location = "/dahaejo/board/adminBoard/adminList.jsp";
		</script>
	<%
	}else{

	String sql = " select count(*) over() cnt, gid, insort from adminboard "
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
	String sql2 = " select count(*) cnt2 from adminboard  "
				+ "   where gid='"+gid+"' "
				+ "     and insort like '"+insort+"_' ";
	
	ResultSet rs2 = stmt.executeQuery(sql2);
	rs2.next();
	int cnt2 = rs2.getInt("cnt2");
	
	String sql3 = "";
	
	if( cnt2 == 0 ) {
		sql3 = " delete from adminboard where unq='"+unq+"'  ";
	} else {
		sql3 = " update adminboard set title='삭제된 글',content='' "
			 + "  where  unq='"+unq+"' ";
	}
	stmt.executeUpdate(sql3);
	
	%>
	<script>
		alert("글이 삭제되었습니다.");
		location = "adminList.jsp";
	</script>
	
<%
}
%>
	

