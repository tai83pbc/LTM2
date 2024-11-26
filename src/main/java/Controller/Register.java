package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.UserBO;
import model.bean.User;

@WebServlet("/Register")
public class Register extends HttpServlet {
		private static final long serialVersionUID = 1L;
		public Register() {
			super();
		}
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			UserBO bo = new UserBO();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			user.setUsername(username);
			try {
				bo.addUser(user);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("Login.jsp");
		}
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request,response);
		}
}
