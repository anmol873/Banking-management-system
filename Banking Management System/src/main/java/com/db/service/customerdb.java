package com.db.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.BeanClass.beancust;

public class customerdb {
	public ArrayList<beancust> customerdetail(){
		ArrayList<beancust> cd=new ArrayList<beancust>();
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanbank","root","masterkey"); 
				Statement stmt=con.createStatement();  
				ResultSet rs=stmt.executeQuery("select * from customers_ac_detail");  
				while(rs.next())  {
					beancust bcn=new beancust();
					bcn.setAc(rs.getInt(1));
					bcn.setName(rs.getString(2));
					bcn.setEmail(rs.getString(3));
					bcn.setBalance(rs.getInt(4));
					
				cd.add(bcn);
				}
				con.close(); 
				}
				
				catch(Exception e){ 
					System.out.println(e);
					}
			return cd;

		}
}
