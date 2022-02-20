<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    background-image: url(img/bai.jpg);
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
/* main */
.main{
font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
font-size: x-large;
text-align: center;
padding-top: 100px;
}
.footer{
  font-size: 20px;
  font-family:fantasy;
  text-align: center;
  font: bold;

}
    </style>
</head>
<body>
      <div class="topnav">
        <a class="active" href="#" >Home</a>
        <a href="customer.jsp">Customers</a>
        <a href="mtran.jsp">Money Transfer</a>
        <a href="trans.jsp">Transaction</a>
        <h3 class="header">Banking Management System</h3>
      </div>
      <div class="main">
        <h1>Easy Way To Transfer</h1>
      </div>
      <div class="footer">
        <p>BY</p>
        <p>Anmol Agrawal</p>
      </div>
</body>
</html>