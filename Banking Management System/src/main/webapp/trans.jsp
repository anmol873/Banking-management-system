<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    		<%@page import="com.BeanClass.tran" %>
		<%@page import="java.util.ArrayList" %>
		<%ArrayList tranlist=(ArrayList)request.getAttribute("trans"); %>
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
    <script>
      function myFunction(){
        alert("Wellcome to san bank");
      }
    </script>
</head>
<body>
      <div class="topnav">
        <a  href="index.jsp">Home</a>
        <a  href="/santhosh_sparks_task1/cust">Customers</a>
        <a href="/santhosh_sparks_task1/smoney">Money Transfer</a>
        <a class="active" href="/santhosh_sparks_task1/tran">Transaction</a>
        <h3 class="header">San Bank Money Transfer</h3>
      </div>
	  <div>
	  <h1 style="color:white; text-align:center;">Last Transaction</h1>
	  </div>
	  
<table>
  <tr>
    <th>SENDER </th>
     <th>RECIVER</th>
    <th>AMOUNT</th>
  </tr>
<%for(int count=0;count < tranlist.size(); count++) {%>
  <tr>
 <% tran tn=(tran)tranlist.get(count); %>
    <td><%=tn.getCustomer_s() %></td>
    <td><%=tn.getCustomer_r() %></td>
     <td><%=tn.getMoney() %></td>
  </tr>
	<%} %>
</table>
</body>
</html>