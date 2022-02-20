package com.db.service;

import java.sql.*;
import java.util.ArrayList;

import com.BeanClass.tran;
import com.BeanClass.BeanMoneySend;

public class dbconnection {
	
	public ArrayList<tran> gettransaction(){
		ArrayList<tran> ctc=new ArrayList<tran>();
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
				Statement stmt=con.createStatement();  
				ResultSet rs=stmt.executeQuery("select * from transfer_table");  
				while(rs.next())  {
					tran tn=new tran();
					tn.setCustomer_s(rs.getString(1));
					tn.setCustomer_r(rs.getString(2));
					tn.setMoney(rs.getInt(3));
					
				ctc.add(tn);
				}

				con.close(); 
				}
		
				catch(Exception e){ System.out.println(e);}  
			return ctc;
	
		}
	
		Connection ct;
		PreparedStatement pst;
	
public int sendercheckbal(BeanMoneySend ms){
	
int senderbal=0;
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
	PreparedStatement pst=con.prepareStatement("select cbalance from customers_ac_detail where AC=?");
	pst.setInt(1, ms.getSender());
	ResultSet rs=pst.executeQuery();
	while(rs.next())  {
		senderbal=rs.getInt(1);
	}
	}
	catch(Exception e){ System.out.println(e);}  
 return senderbal;
}
public String checksendernam(BeanMoneySend ms){
	
String sname="";
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
	PreparedStatement pst=con.prepareStatement("select name from customers_ac_detail where AC=?");
	pst.setInt(1, ms.getSender());
	ResultSet rs=pst.executeQuery();
	while(rs.next())  {
		sname=rs.getString(1);
	}
	}
	catch(Exception e){ System.out.println(e);}  
 return sname;
}
public String checkrecivernam(BeanMoneySend ms){
	
String rname="";
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
	PreparedStatement pst=con.prepareStatement("select name from customers_ac_detail where AC=?");
	pst.setInt(1, ms.getReciver());
	ResultSet rs=pst.executeQuery();
	while(rs.next())  {
		rname=rs.getString(1);
	}
	}
	catch(Exception e){ System.out.println(e);}  
 return rname;
}
public void reciverupdate(BeanMoneySend ms){
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
		PreparedStatement pst=con.prepareStatement("update customers_ac_detail set cbalance=cbalance+? where ac=?");
		pst.setInt(1, ms.getAmtsend());
		pst.setInt(2, ms.getReciver());
		pst.executeUpdate();
		con.close(); 
		}
	catch(Exception e){ System.out.println(e);}  
}
public void senderupdate(BeanMoneySend ms){
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
		PreparedStatement pst=con.prepareStatement("update customers_ac_detail set cbalance=cbalance-? where ac=?");
		pst.setInt(1, ms.getAmtsend());
		pst.setInt(2, ms.getSender());
		pst.executeUpdate();
		con.close(); 
		}
	catch(Exception e){ System.out.println(e);}  
}
public void trantable(BeanMoneySend ms,String sname,String rname){
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root",""); 
		PreparedStatement pst=con.prepareStatement("insert into transfer_table values(?,?,?) ");
		pst.setString(1, sname);
		pst.setString(2, rname);
		pst.setInt(3, ms.getAmtsend());
		pst.executeUpdate();
		con.close(); 
		}
	catch(Exception e){ System.out.println(e);}  
}
}
