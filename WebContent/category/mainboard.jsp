<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp"%>

<%
int unit = 8;

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
String sqlTot = "select count(*) total from mainboard";
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


<!DOCTYPE html>
<html>
<head>
<title>mainboard</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />
</head>
<style>
.form{
	margin-top:50px;
	margin-left:350px
}
</style>
<body class="homepage is-preload">
   <div id="page-wrapper">
      <div id="header">
      <!-- Header -->
         <!-- Nav.jsp -->
         <!-- 상단 메뉴bar -->
         <nav id="nav">
            <%@ include file="../include/nav.jsp"%>
         
   <%
   //조건별 검색 sql
   String searchSQL =	" select b.*from ( "
		   			+	"	select rownum rn, a.* from "
   					+	"		(select name,link,company,price from mainboard b "
   					+	"		order by price ) a ) b "
   					+	" where rn >= " + startIdx + " and rn <= " + endIdx;
   
   ResultSet rs = stmt.executeQuery(searchSQL);
   %>
   
   
	<form class="form" name = "frm" method = "post" action = "mainboardPriceList.jsp" style="width:1000px; margin-left:450px;">
	가격대 선택<br>
		<select name = "priceList">
			<option value = "&lt;=100000">100,000원 이하</option>
			<option value = "between 100000 and 199999">100,000 ~ 199,999</option>
			<option value = "between 200000 and 299999">200,000 ~ 299,999</option>
			<option value = "between 300000 and 399999">300,000 ~ 399,999</option>
			<option value = "between 400000 and 499999">400,000 ~ 499,999</option>
			<option value = "between 500000 and 599999">500,000 ~ 599,999</option>
			<option value = "between 600000 and 699999">600,000 ~ 699,999</option>
			<option value = "between 700000 and 799999">700,000 ~ 799,999</option>
			<option value = "between 800000 and 899999">800,000 ~ 899,999</option>
			<option value = "between 900000 and 999999">900,000 ~ 999,999</option>
			<option value = "between 1000000 and 10000000">1,000,000원 이상</option>
		</select>
		<button type="submit" style="cursor:pointer">검색</button>
	</form>
   
   <br> <br>
   <table class="table1" border="1" width="630px" align="center" style=margin-top:20px;>

      <tr align="center" style="color:orange">
         <th>상품</th>
         <th>가격</th>
         <th>회사</th>
         <th>네이버쇼핑</th>
      </tr>
      
      <%
      while( rs.next() ) {
         
         String name = rs.getString("name");
         int price = rs.getInt("price");
         String company = rs.getString("company");
         String link = rs.getString("link");
      %>

      <tr align="center">
         <td><a href="<%=link%>"><%=name %></a></td>
         <td><%=price %></td>
         <td><%=company %></td>
         <td><a href="<%=link %>">☞최저가 바로가기</a></td>
      </tr>
      <%
      }
      %>

   </table>
   
   <table border="0" width="600" align="center">
		<tr>
			<td align="center">
			
			<%
			for( int i=1; i<=lastpage; i++ ) {
			%>
				  <a href="mainboard.jsp?page=<%=i %>"><%=i %></a>
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