package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.UserBO;

@WebServlet("/ViewWatch")
public class ViewWatch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewWatch() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String d =(String)request.getSession().getAttribute("account");
		if(d!=null) {
			response.sendRedirect("Watch.jsp");
		}
		else {
			response.sendRedirect("Login.jsp");
		}
	}

protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	doGet(request, response);
}
}
