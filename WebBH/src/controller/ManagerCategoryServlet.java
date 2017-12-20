
package controller;

import dao.CategoryDAOImpl;
import model.Category;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//@WebServlet("/ManagerCategoryServlet")
public class ManagerCategoryServlet extends HttpServlet {

	CategoryDAOImpl categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String category_id = request.getParameter("category_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    categoryDAO.deleteCategory(Long.parseLong(category_id));
                    url = "/admin/manager_category.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenDanhMuc = request.getParameter("tenDanhMuc");
        String url = "", error = "";
        if (tenDanhMuc.equals("")) {
            error = "Vui long nhap ten danh muc!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	CategoryDAOImpl.insertCategory(tenDanhMuc);
                        url = "/admin/manager_category.jsp";
                        break;
                    case "update":
                    	String cat_id = request.getParameter("cat_id");
                    	String cat_cha = request.getParameter("category_cha");
                    	String ten = request.getParameter("tenDanhMuc");
                    	Category c = new Category(Long.parseLong(cat_id),ten,cat_cha);
                    	CategoryDAOImpl.updateCategory(c);
                        url = "/admin/manager_category.jsp";
                        break;
                }
            } else {
                url = "/admin/insert_category.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
