package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAOImpl;
import model.Users;
import tools.MD5;

public class RegisterServlet extends HttpServlet {

	private UsersDAOImpl userDAO = new UsersDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPass = request.getParameter("userPass");

		String userName_err = "", userEmail_err = "", userPass_err = "";
		if (userName.equals("")) {
			userName_err = "Please enter your name !";
		}

		if (userName_err.length() > 0) {
			request.setAttribute("userName_err", userName_err);
		}

		if (userEmail.equals("")) {
			userEmail_err = "Please enter your email address !";
		} else if (userDAO.CheckUsers(userEmail) == true) {
			userEmail_err = "This email address is already registered !";
		}

		if (userEmail_err.length() > 0) {
			request.setAttribute("userEmail_err", userEmail_err);
		}

		if (userPass.equals("")) {
			userPass_err += "Please enter your password !";
		}

		if (userPass_err.length() > 0) {
			request.setAttribute("userPass_err", userPass_err);
		}
		request.setAttribute("userName", userName);
		request.setAttribute("userEmail", userEmail);
		request.setAttribute("userPass", userPass);

		String url = "/account.jsp";
		try {
			if (userPass_err.length() == 0 && userEmail_err.length() == 0 && userName_err.length() == 0) {
				Date id = new Date();

				Users tk = new Users("" + id.getTime(), userName, userEmail, MD5.encryption(userPass), 1);
				userDAO.AddUsers(tk);
				url = "/index.jsp";

			} else {
				url = "/account.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
