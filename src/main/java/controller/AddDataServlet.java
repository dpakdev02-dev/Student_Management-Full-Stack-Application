package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;
import model.Student;

@WebServlet("/addRow")
public class AddDataServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		double marks=Double.parseDouble(req.getParameter("marks"));
		long contact=Long.parseLong(req.getParameter("contact"));
		String gender=req.getParameter("gender");
		
		Student s=new Student();
		s.setId(id);
		s.setName(name);
		s.setMarks(marks);
		s.setGender(gender);
		s.setContact(contact);
		
		UsersDAO dao=new UsersDAO();
		
		try {
			dao.addData(s);
			RequestDispatcher dispatcher =req.getRequestDispatcher("dashboard");
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
