<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp"%>

<%
String priceList = request.getParameter("priceList");

String mainboardPrice = priceList;
%>

<%
	String p = "";

int unit = 8;
int viewPage = 0;
String start = "";

if (request.getParameter("page") == null || request.getParameter("page").equals("")
		|| request.getParameter("page") == "1" || request.getParameter("page").equals("1")) {
	p = "1";
	viewPage = Integer.parseInt(p);
	start = p;
} else {
	p = request.getParameter("page");
	viewPage = Integer.parseInt(p);
	start = ((viewPage - 1) * unit + 1) + "";
}

if (request.getParameter("priceList") == null || request.getParameter("priceList").equals("")) {
	mainboardPrice = "";
} else {
	mainboardPrice = request.getParameter("priceList");
}


int startIdx = (viewPage - 1) * unit + 1;
int endIdx = startIdx + (unit - 1);

String sqlTot = "select count(*) total from mainboard"
			+	"	where price " + mainboardPrice;


ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total");


int startpage = ((viewPage - 1) / unit) * unit + 1;
int endpage = startpage + (unit - 1);

int lastpage = (int)Math.ceil((double)total/unit);

if(endpage > lastpage) {
	  endpage = lastpage;
}
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
   					+	"	where price " + mainboardPrice
   					+	"		order by price ) a ) b "
   					+	" where rn >= " + startIdx + " and rn <= " + endIdx;
   
   ResultSet rs = stmt.executeQuery(searchSQL);
   %>
   
   
	<form class="form" name = "frm" method = "post" action = "mainboardPriceList.jsp" style="width:1000px" >
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
	      String link = "mainboardPriceList.jsp?priceList=" + mainboardPrice;
	
	      
	      for(int z=startpage; z<=endpage; z++){
	     	 if(z == viewPage){
	     	 %>
	     	 	<b><%=z %></b>
	     	 <%
	     	 }else{
	     	 %>
	     	 	<a href = "<%=link %>&page=<%=z %>"><%=z %></a>
	     	 <%
	     	 }
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