package com.servlet.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BeanClass.BeanMoneySend;
import com.db.service.dbconnection;
/**
 * Servlet implementation class sendmoney
 */
@WebServlet("/smreq")
public class sendmoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendmoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		int sender=Integer.parseInt(request.getParameter("sval0"));//type cast string into integer
		int reciver=Integer.parseInt(request.getParameter("sval1"));
		int amtsend=Integer.parseInt(request.getParameter("amtsend"));
		BeanMoneySend ms=new BeanMoneySend();
		ms.setSender(sender);
		ms.setReciver(reciver);
		ms.setAmtsend(amtsend);
		dbconnection dc=new dbconnection();
		int cb=dc.sendercheckbal(ms);
		String checksendername=dc.checksendernam(ms);//checksendernam
		String checkrecivername=dc.checkrecivernam(ms);//checkrecivernam
		if(amtsend<=cb){
			System.out.print(amtsend+" "+cb+" "+checksendername+" "+checkrecivername);
			dbconnection dt=new dbconnection();
			dt.reciverupdate(ms);
			dt.senderupdate(ms);
			dt.trantable(ms,checksendername,checkrecivername);
			out.println("<script type=\"text/javascript\">");	
			out.println("alert('Your Money Transfer Successfully...!');");
			out.println("location='/santhosh_sparks_task1/tran';");
			//RequestDispatcher rd=request.getRequestDispatcher("");
			//rd.forward(request, response);
			out.println("</script>");
			
			
		}
		else{
			
			out.println("<script type=\"text/javascript\">");	
			out.println("alert('sender balance insuffcient....! ');");
			out.println("location='/santhosh_sparks_task1/smoney';");
			out.println("</script>");
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
