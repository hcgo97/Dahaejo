<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/dbCon.jsp" %>    
<%
String userid = (String)session.getAttribute("SessionId");
String title = request.getParameter("title");
String content = request.getParameter("content");
String gid = request.getParameter("gid");

System.out.println("gid="+gid);

String insort = request.getParameter("insort");
%>

<%
String sql =	"select nvl(max(insort), '' ) as maxInsort from oneonone " +
	        	"   where gid = '" + gid + "' " +
		    	"     and insort like '" + insort + "%' ";

ResultSet rs = stmt.executeQuery(sql);

String maxInsort = "";
String myInsort = "";

if(rs.next() ){
	maxInsort = rs.getString("maxInsort");
}

if( maxInsort.equals(""))  {
	myInsort = insort + "a";  // a -> aa
} else {
	char value = maxInsort.charAt(maxInsort.length()-1);
	value++;
	myInsort = insort + value;
}

String sql2 = " insert into oneonone "
	       + " ( unq,title,name,content,rdate,gid,insort) "
	       + " values "
	       + " ( oneonone_seq.nextval,'"+title+"','"+userid+"','"+content+"', sysdate ,"
	       + "   '"+gid+"' ,'"+myInsort+"')";

int result = stmt.executeUpdate(sql2);
if( result > 0 ) {
%>
	<script>
	alert("저장성공");
	location.href = "oneOnOneList.jsp";
	</script>
<%
}
%>









