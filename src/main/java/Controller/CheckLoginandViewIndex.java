package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.UserBO;
import model.DAO.UserDAO;
import model.bean.User;


@WebServlet("/CheckLoginandViewIndex")
public class CheckLoginandViewIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckLoginandViewIndex() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserBO bo = new UserBO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			if(bo.checkUser(username, password)) {
				String d = username + " "+ password;
				request.getSession().setAttribute("account", d);
				response.sendRedirect("Index.jsp");
			}
			else {
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
