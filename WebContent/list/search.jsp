<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="../include/dbCon.jsp"%>

<%
String kind = request.getParameter("kind");
String price = request.getParameter("price");
String price2 = request.getParameter("price2");
%>


<!DOCTYPE html>
<html>
<head>
<title>검색결과</title>
<meta charset="utf-8" />
<meta name="viewport"
content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../include/assets/css/main.css" />
</head>

<!-- 
<script>
function game_image() {
	var myimages = new Array();
	
	myimages[0] = "../include/photo/game/1.jpg";
	myimages[1] = "../include/photo/game/2.jpg";
	myimages[2] = "../include/photo/game/3.jpg";
	myimages[3] = "../include/photo/game/4.jpg";
	myimages[4] = "../include/photo/game/5.jpg";

	var ry = Math.floor(Math.random() * (myimages.length - 1));
	document.write('<img src="' + myimages[ry] + '" border=0>');
}

function office_image() {
	var myimages = new Array();
	
	myimages[0] = "../include/photo/office/1.jpg";
	myimages[1] = "../include/photo/office/2.jpg";
	myimages[2] = "../include/photo/office/3.jpg";

	var ry = Math.floor(Math.random() * (myimages.length - 1));
	document.write('<img src="' + myimages[ry] + '" border=0>');
}

function graphic_image() {
	var myimages = new Array();
	
	myimages[0] = "../include/photo/graphic/1.jpg";
	myimages[1] = "../include/photo/graphic/2.jpg";
	myimages[2] = "../include/photo/graphic/3.jpg";

	var ry = Math.floor(Math.random() * (myimages.length - 1));
	document.write('<img src="' + myimages[ry] + '" border=0>');
}
</script> -->



<%-- <script>
function random_image() {
	var myimages = new Array();
	
	if(<%=kind %> == "배그" || <%=kind %> == "롤" || <%=kind %> == "피파" || <%=kind %> == "옵치" || <%=kind %> == "콜옵"){
	myimages[0] = "../include/photo/game/1.jpg";
	myimages[1] = "../include/photo/game/2.jpg";
	myimages[2] = "../include/photo/game/3.jpg";
	myimages[3] = "../include/photo/game/4.jpg";
	myimages[4] = "../include/photo/game/5.jpg";
	}else if(<%=kind %> == "사무용"){
		myimages[0] = "../include/photo/office/1.jpg";
		myimages[1] = "../include/photo/office/2.jpg";
		myimages[2] = "../include/photo/office/3.jpg";
	}else if(<%=kind %> == "그래픽작업"){
		myimages[0] = "../include/photo/graphic/1.jpg";
		myimages[1] = "../include/photo/graphic/2.jpg";
		myimages[2] = "../include/photo/graphic/3.jpg";
	}

	var ry = Math.floor(Math.random() * (myimages.length - 1));
	document.write('<img src="' + myimages[ry] + '" border=0>');
}
</script> --%>


<body class="homepage is-preload">
       <div id="page-wrapper">
            <div id="header">
            <!-- Header -->
                <nav id="nav">
                     <%@ include file="../include/nav.jsp"%>

               <section id="features" class="container special">
                  <header>
                     <h3 style="color:pink">★<%=kind %> <%=price %>원 ~ <%=price2 %>원 사양의 컴퓨터 검색 결과★</h3>
                  </header>
                  <div class="row">
                  
                  <%
                  String p = "";
                  
                  int unit = 3;			// 한 페이지 출력 개수
                  int viewPage = 0;		// 페이지 번호
                  String start = "";
                  
                  if(request.getParameter("page") == null || request.getParameter("page").equals("")
                	|| request.getParameter("page") == "1" || request.getParameter("page").equals("1") ) {
                	p = "1";
                	viewPage = Integer.parseInt(p);
                	start = p;
                  } else {
                	  p = request.getParameter("page");
                	  viewPage = Integer.parseInt(p);
                	  start = ((viewPage - 1) * unit + 1) + "";
                  }
                  
                  if(request.getParameter("kind") == null || request.getParameter("kind").equals("")) {
                	   kind = "";
                	} else {
                	   kind = request.getParameter("kind");
                	}

                	if(request.getParameter("price") == null || request.getParameter("price").equals("")) {
                	   price = "";
                	} else {
                	   price = request.getParameter("price");
                	}

                	if(request.getParameter("price2") == null || request.getParameter("price2").equals("")) {
                	   price2 = "";
                	} else {
                	   price2 = request.getParameter("price2");
                	}
                	

                  String sqlTot = " select count(*) total from ( "   
                         +  "        select b.* from "
                         +  "         ( select rownum rn, a.* from "
                         +  "             ( select c.name, c.opt, " 
                           +   "      cpu.name as cpu_name, " 
                           +   "      mainboard.name as mainboard_name, " 
                           +   "      memory.name as memory_name, " 
                           +   "      gpu.name as gpu_name, " 
                           +   "      power.name as power_name, " 
                           +   "      ssdhdd.name as ssdhdd_name, " 
                           +   "      cpu.price+mainboard.price+memory.price+gpu.price+power.price+ssdhdd.price as sum "
                           +   "          from computer c " 
                           +   "   inner join cpu cpu " 
                           +   "      on c.cpu = cpu.name " 
                           +   "   inner join mainboard mainboard " 
                            +   "      on c.mainboard = mainboard.name " 
                           +   "   inner join memory memory " 
                            +   "      on c.memory = memory.name " 
                           +   "   inner join gpu gpu " 
                            +   "      on c.gpu = gpu.name " 
                           +   "   inner join power power " 
                            +   "      on c.power = power.name " 
                           +   "   inner join ssdhdd ssdhdd " 
                            +   "      on c.ssdhdd = ssdhdd.name " 
                           +   "          where   c.name like '%" + kind + "%' " 
                            +   "   and " 
                             +   "      cpu.price+mainboard.price+memory.price+gpu.price+power.price+ssdhdd.price " 
                             +  "            between " + price + " and " + price2 + " "
                             +   "   order by cpu.price+mainboard.price+memory.price+gpu.price+power.price+ssdhdd.price ) a ) b )";
                         
                  ResultSet rsTot = stmt.executeQuery(sqlTot);
                  rsTot.next();
                  int total = rsTot.getInt("total");
                  
                  int startIdx = ((viewPage - 1) * unit) + 1;		// unit=3 이면 10
                  int endIdx = startIdx + (unit-1);					// 			  12
              	
              	
                  int startpage = ((viewPage - 1) / unit) + 1;		// unit=3 일 때 1~3은 2를 안넘김,4부턴 2를 넘김/ 어느 숫자가 오든 0<1<2를 유지할려면?
                		  if(viewPage > unit) {						// viewPage가 unit보다 클때도 1이 유지되도록 한다.
                			  startpage = 1;
                		  }
                  
                  int lastpage = (int)Math.ceil((double)total/unit);	// total = 14 이면 4.6 -> 5                  

                  
                  //조건별 검색 sql
                  String searchSQL =   "   select b.* from "
                                   +   "   ( select rownum rn, a.* from "
                                   +   "       ( select c.name, c.opt, " 
                                   +   "      cpu.name as cpu_name, " 
                                   +   "      mainboard.name as mainboard_name, " 
                                   +   "      memory.name as memory_name, " 
                                   +   "      gpu.name as gpu_name, " 
                                   +   "      power.name as power_name, " 
                                   +   "      ssdhdd.name as ssdhdd_name, " 
                                   +   "      cpu.price+mainboard.price+memory.price+gpu.price+power.price+ssdhdd.price as sum "
                                   +   "          from computer c " 
                                   +   "   inner join cpu cpu " 
                                   +   "      on c.cpu = cpu.name " 
                                   +   "   inner join mainboard mainboard " 
                                   +   "      on c.mainboard = mainboard.name " 
                                   +   "   inner join memory memory " 
                                   +   "      on c.memory = memory.name " 
                                   +   "   inner join gpu gpu " 
                                   +   "      on c.gpu = gpu.name " 
                                   +   "   inner join power power " 
                                   +   "      on c.power = power.name " 
                                   +   "   inner join ssdhdd ssdhdd " 
                                   +   "      on c.ssdhdd = ssdhdd.name " 
                                   +   "          where   c.name like '%" + kind + "%' " 
                                   +   "   and " 
                                   +   "      cpu.price+mainboard.price+memory.price+gpu.price+power.price+ssdhdd.price " 
                                   +   "            between " + price + " and " + price2 + " "
                                   +   "   order by cpu.price+mainboard.price+memory.price+gpu.price+power.price+ssdhdd.price ) a ) b "
                                   +   "      where rn >= "+startIdx+" and rn <= "+endIdx+" ";
                  
                  ResultSet rs = stmt.executeQuery(searchSQL);
                  %>
                  
                  <%
                  while( rs.next() ) {
                     String name = rs.getString("name");
                     String cpu = rs.getString("cpu_name");
                     String mainboard = rs.getString("mainboard_name");
                     String memory = rs.getString("memory_name");
                     String gpu = rs.getString("gpu_name");
                     String power = rs.getString("power_name");
                     String ssdhdd = rs.getString("ssdhdd_name");
                     String opt = rs.getString("opt");
                     int sumPrice = rs.getInt("sum");
                  %>

                     <article class="col-4 col-12-mobile special">
                        <a href="" class="image featured">
                        
                        <script>
							function show_image() {
								var myimages = new Array();
								
								myimages[0] = "../include/photo/1.jpg";
								myimages[1] = "../include/photo/2.jpg";
								myimages[2] = "../include/photo/3.jpg";
								myimages[3] = "../include/photo/4.jpg";
								myimages[4] = "../include/photo/5.jpg";
								myimages[5] = "../include/photo/6.jpg";
								myimages[6] = "../include/photo/7.jpg";
								myimages[7] = "../include/photo/8.jpg";
							
								var ry = Math.floor(Math.random() * (myimages.length - 1));
								document.write('<img src="' + myimages[ry] + '" width = "150" height = "300" border="0">');
								
							} show_image();
                        </script>
                        
                        </a>
                        <header>
                           <h3 style = "color :white"><%=name %></h3>
                        </header>
                        <p style="text-align:center">
                        <%=sumPrice %>원<br>
                        <%=cpu %><br>
                        <%=mainboard %><br>
                        <%=memory %><br>
                        <%=gpu %><br>
                        <%=power %><br>
                        <%=ssdhdd %><br>
                        <%=opt %><br>
                        </p>
                     </article>
                     <%
                     }
                     %>
                     
                     <table border="0" width="600" align="center">
                  <tr>
                     <td align="center">
                     
                     <%
                     String link = "search.jsp?kind=" + kind + "&price=" + price + "&price2=" + price2;

                     
			    for(int z=startpage; z<=lastpage; z++){
			    	 if(z == viewPage){
			    %>
			    	 	<b><%=z %></b>
			    <%
			} else {
			%>														<!-- total = 14 ,unit = 3일 때 총 페이지는 1,2,3,4,5 -->
			    <a href = "<%=link %>&page=<%=z %>"><%=z %></a>		<!-- 1,2,3 을 눌렀을 땐 1~5까지 잘뜸. 하지만 4페이지를 누르면 1,2,3 사라짐 -->
			<%														//   4페이지를 눌렀을 때도 총 페이지가 1,2,3,4,5 가 나오도록 해야됨
			    	}												//   unit안에 포함된 수의 페이지를 누르면 정상적으로 lastpage까지 출력되지만
			}														//   unit 이상 페이지를 누르면 출력하는 페이지가 unit씩 나오게 되어 누르는 수의 앞 unit
			%>														<!-- 수만큼 짤린다. startpage 문제로 보임-->

               
                     </td>
                  </tr>
               </table>
                  </div>
               </section>
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