<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.BeanClass.beancust" %>
<%@page import = "com.db.service.customerdb" %>
<%@page import="java.util.ArrayList" %>
<%ArrayList custlist=(ArrayList)request.getAttribute("cdetail"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAN BANK</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <style>
  body {
    margin: 0;
    background-image: url('img/wallpaper-442451.jpg');

  }
  .header {
    float: left;
    color: #ddd;
    font-family: "Sofia", sans-serif;
    padding-left: 20px;
  }

  /* nav bar*/
.topnav {
  overflow: hidden;
  background-color: #000000;
  font-family: "Sofia", sans-serif;
  font-size: 20px;
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 30px 30px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #cca833;
  color: white;
}
/*-----main------*/
.main{
font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
font-size: x-large;
text-align: center;
padding-top: 100px;
}
.footer{
  font-size: 20px;
  font-family:sans-serif;
  text-align: center;
  font: bold;
}
/*-----table----*/
table {
  font-family: arial, sans-serif;
  background-color:white;
  border-radius:25px;
  margin:10px 70px 70px 70px;
  width:90%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  border-radius:25px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

    </style>
    
</head>
<body>
      <div class="topnav">
        <a  href="index.jsp">Home</a>
        <a class="active" href="/santhosh_sparks_task1/cust">Customers</a>
        <a href="mtran.jsp">Money Transfer</a>
        <a href="/santhosh_sparks">Transaction</a>
        <h3 class="header">Bank Management System</h3>
      </div>
	  <div>
	  <h1 style="color:white; text-align:center;">Customers Details</h1>
	  </div>
	  
<table>
  <tr>
    <th>ACCOUNT NUMBER</th>
    <th>NAME</th>
    <th>EMAIL</th>
    <th>BALANCE</th>
  </tr>
  <% customerdb csdb = new customerdb();
  	ArrayList <beancust> custlist1 = csdb.customerdetail();
  for(int count=0;count < custlist1.size(); count++) {%>
  <tr>
  <% beancust cu=(beancust)custlist1.get(count); %>
    <td><%=cu.getAc() %></td>
    <td><%=cu.getName() %></td>
   <td><%=cu.getEmail() %></td>
   <td><%=cu.getBalance() %></td>
  </tr>
  <%} %>
</table>
</body>

</html>