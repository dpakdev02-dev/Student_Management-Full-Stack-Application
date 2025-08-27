package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;

@WebServlet("/deleteData")
public class DeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		
		UsersDAO dao=new UsersDAO();
		
		try {
			if (dao.deleteRow(id)==0) {
				req.setAttribute("DeletedStatus", "Data Not Found");
				RequestDispatcher dispatcher= req.getRequestDispatcher("dashboard");
				dispatcher.forward(req, resp);
			}
			else {
				req.setAttribute("DeletedStatus", "Delete Successfully");
				RequestDispatcher dispatcher= req.getRequestDispatcher("dashboard");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
