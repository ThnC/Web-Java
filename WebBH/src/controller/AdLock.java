package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAOImpl;
import tools.MD5;

public class AdLock extends HttpServlet {
	private UsersDAOImpl userDAO = new UsersDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("command").equals("logout")) {
			HttpSession session = request.getSession();
			
			session.invalidate();
			response.sendRedirect("/WebBH/admin/lock.jsp");

			
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userEmail = request.getParameter("userEmail");
		String userPass = request.getParameter("userPass");

		String err = "";
		if (userEmail.equals("") || userPass.equals("")) {
			err = "Please enter your infomation !";
		} else if (userDAO.CheckLogin(userEmail, MD5.encryption(userPass)) == false) {
			err = "sai Email or Password !";

		}

		if (err.length() > 0) {
			request.setAttribute("err", err);
		}

		String url = "/admin/lock.jsp";
		try {
			if (err.length() == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("username", userEmail);
				url = "/admin/index.jsp";
			} else {
				url = "/admin/lock.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {

		}
	}

}
