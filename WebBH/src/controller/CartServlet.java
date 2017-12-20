package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAOImpl;
import model.Cart;
import model.Product;

public class CartServlet extends HttpServlet {
	private ProductDAOImpl productDAO = new ProductDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String msp = request.getParameter("product_id");
		String command = request.getParameter("command");
		ArrayList<Long> listBuy = null;
		String url = "/cart.jsp";
		try {
			listBuy = (ArrayList<Long>) session.getAttribute("cartID");
			long idBuy = 0;
			if (request.getParameter("cartID") != null) {
				idBuy = Long.parseLong(request.getParameter("cartID"));
			}
			Product sp = productDAO.getProduct_detail(msp);
			switch (command) {
			case "insert":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cartID", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.addToCart(sp, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "plus":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cart", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.addToCart(sp, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "sub":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cart", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.supToCart(sp, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "remove":
				cart.removeToCart(sp);
				url = "/cart.jsp";
				break;
			default:
				break;
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {

		}

	}

}
