<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>    
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");

String content = request.getParameter("content");
String gid = request.getParameter("gid");
String insort = request.getParameter("insort");

if( title == null || title.equals("") ) {
%>
	<script>
	alert("제목을 입력해주세요.");
	history.back(); // 이전화면 go
	</script>
<%
	return;  // jsp stop;
}
String sql2 = "select nvl(max(insort),'_') as insort,own from qnaboard "
	        + "   where gid='"+gid+"' " 
		    + "     and insort like '"+insort+"_' ";

ResultSet rs = stmt.executeQuery(sql2);
rs.next();
String maxInsort = rs.getString("insort");
String owner = rs.getString("own");

String myInsort = "";
if( maxInsort.equals("_"))  {
	myInsort = insort + "a";  // a -> aa
} else {
	String y1 = maxInsort.substring(0,maxInsort.length()-1); // 0 ~ 0
	char y2 = maxInsort.charAt(maxInsort.length()-1); // 1번 자리의 값 -> a
	y2++; // b
	myInsort = y1 + y2;
}

String sql = " insert into qnaboard "
	       + " ( unq,title,pass,content,rdate,gid,insort,own ) "
	       + " values "
	       + " ( qnaboard_seq.nextval,'"+title+"','"+pass+"','"+content+"', sysdate ,"
	       + "   '"+gid+"' ,'"+myInsort+"', '"+owner+"' )";

int result = stmt.executeUpdate(sql);
if( result > 0 ) {
%>
	<script>
	alert("저장성공");
	location.href = "oneOnOneList.jsp";
	</script>
<%
}
%>









