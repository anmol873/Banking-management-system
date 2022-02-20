<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.BeanClass.beancust" %>
<%@page import="java.util.ArrayList" %>
<%ArrayList custlist=(ArrayList)request.getAttribute("cdetail"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAN BANK</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <style>
        body {
            margin: 0;
            background-image: url('img/money.png');
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
        /* payment bar */
        .paymentbar {
            height: 380px;
            width: 700px;
            margin: auto;
            padding: 10px;
            text-align: center;
            border: 2px solid red;
            border-radius: 4px;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.5);
            color: #ddd;
        }
        .button1 {
            text-align: center;
            margin: auto;
            padding: 10px;
        }
        #MPAY {
            text-align: center;
            background-color: #4CAf50;
            color: white;
            border: none;
            padding: 15px 32px;
            cursor: pointer;
            font-size: 16px;
            display: inline-block;
        }
        /* <select> styles */
        select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 8px;
            outline: 0;
            font: inherit;
            /* Personalize */
            width: 20em;
            height: 3em;
            padding: 0 4em 0 1em;
            color: black;
            border-radius: 0.25em;
            box-shadow: 0 0 1em 0 rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }
        select option {
            color: inherit;
            background-color: bisque;
        }
        select:focus {
            outline: none;
        }
        select::-ms-expand {
            display: none;
        }
        .paybarsbtn {
            margin-top: 20px;
            text-align: center;
            background-color: #4CAf50;
            color: white;
            border: none;
            padding: 15px 32px;
            cursor: pointer;
            font-size: 16px;
            display: inline-block;
        }
        #baramt {
            margin-top: 30px;
            padding: 10px;
        }
    </style>
</head>

<body>
    <div class="topnav">
        <a href="index.jsp">Home</a>
        <a href="/santhosh_sparks_task1/cust">Customers</a>
        <a class="active" href="/santhosh_sparks_task1/smoney">Money Transfer</a>
        <a href="/santhosh_sparks_task1/tran">Transaction</a>
        <h3 class="header">San Bank Money Transfer</h3>
    </div>
   

    <!-- payment button -->
    <div class="button1">
        <button id="MPAY">SEND MONEY</button>
    </div>
    <!--payment bar -->
    <div class="paymentbar" style="visibility: hidden;" id="paybar">
        <h3>Transfer Money</h3>
        <form onsubmit="return fn1()" action="/santhosh_sparks_task1/smreq">
        <div>
            SENDER :<select name="sval0" id="selectbox0">
                <option selected value="0">Select sender</option>
                <%for(int count=0;count < custlist.size(); count++) {%>
                <% beancust cu=(beancust)custlist.get(count); %>
                <option value="<%=cu.getAc() %>"><%=cu.getName() %></option>
               <% } %>
            </select>
            <h5>TO</h5>
            RECIVER :<select name="sval1"  id="selectbox1">
                <option selected value="0">Select reciver</option>
                  <%for(int count=0;count < custlist.size(); count++) {%>
                    <% beancust cu=(beancust)custlist.get(count); %>
                <option value="<%=cu.getAc() %>"><%=cu.getName() %></option>
               <% } %>
           
            </select><br>
                    
   
            
                <input id="baramt" type="text" placeholder="Enter The Amount" name="amtsend"><br>
                <button class="paybarsbtn" id="sendbtn">SEND</button>
            </form>
       </div>
    </div>
    
    <div>
</body>
<script src="js/jquery.js"></script>
<script>
    $(".paymentbar").hide("fast");
    $(document).ready(function () {
        $("#MPAY").click(function () {
            $(".paymentbar").slideDown();
            document.getElementById("paybar").style.visibility = "visible";
        });
        $("#sendbtn").click(fn1);
        function fn1() {
            var sel1 = document.getElementById("selectbox1");
            var sel0 = document.getElementById("selectbox0");
            var amt = document.getElementById("baramt").value;

            if (sel0.options[sel0.selectedIndex].value == 0 && sel1.options[sel1.selectedIndex].value == 0) {
                alert("please selected both sender and reciver");
                return false;
            }
            else if (sel0.options[sel0.selectedIndex].value == 0) {
                alert("please select from the sender");
                return false;
            }
            else if (sel1.options[sel1.selectedIndex].value == 0) {
                alert("please select from the reciver");
                return false;
            }
            else if (sel0.options[sel0.selectedIndex].value == sel1.options[sel1.selectedIndex].value) {
                alert("same account number selected");
                return false;
            }
            else if (amt == "") {
                alert("Amount is empty");
                return false;
            }
            else if (amt < 1) {
                alert("enter a valid amount");
                return false;
            }
            else {
                //alert("Your Money Transfer Successfully...!");
                return true;
            }

        }
    });
</script>
</html>