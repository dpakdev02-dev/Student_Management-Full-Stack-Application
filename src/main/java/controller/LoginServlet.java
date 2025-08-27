package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import model.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user=req.getParameter("username");
		String pass=req.getParameter("password");
		
		UsersDAO dao =new UsersDAO();
		try {
			User u=dao.LoginAuthenticate();
			if (u.getUsername().equals(user)) {
				if (u.getPassword().equals(pass)) {
					HttpSession session= req.getSession(true);
					session.setAttribute("LoginSuccessful","Login Done" );
					RequestDispatcher dispatcher=req.getRequestDispatcher("dashboard");
					dispatcher.forward(req, resp);
				}
				else {
					req.setAttribute("LoginFailed", "Invalid Password");
					RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
					dispatcher.include(req, resp);
				}
			}
			else {
				req.setAttribute("LoginFailed", "Username Not Found");
				RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
				dispatcher.include(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
