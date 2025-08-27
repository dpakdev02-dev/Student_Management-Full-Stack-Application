package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;

@WebServlet("/dashboard")
public class DisplayAllServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDAO dao=new UsersDAO();
		ResultSet set;
		try {
			set = dao.DisplayAll();
			req.setAttribute("Display", set);
			RequestDispatcher dispatcher = req.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
