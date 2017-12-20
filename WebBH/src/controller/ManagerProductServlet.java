package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductDAOImpl;
import model.Product;

//@WebServlet("/ManagerProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ManagerProductServlet extends HttpServlet {


	ProductDAOImpl productDAO = new ProductDAOImpl();


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                	productDAO.deleteProduct(product_id);
                    url = "/admin/manager_product.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");
        String product_name = request.getParameter("product_name");
		Part part = request.getPart("product_image");
        String category_id = request.getParameter("category_id");
        String product_quantity = request.getParameter("product_quantity");
        String product_description = request.getParameter("product_description");
        String pro_price = request.getParameter("pro_price");

        String product_image = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String savePath1 = getServletContext().getRealPath("/").replace("\\", "/");
        String url = "", error = "";

        try {
//            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	try {

                        String savePath = savePath1 + "img/" + product_image;
                        System.out.println(savePath1);
                        File fileSaveDir = new File(savePath);
                        part.write(savePath);
                    	Product p = new Product();
                    	p.setProduct_id(product_id);
                    	p.setProduct_name(product_name);
    					p.setProduct_image(product_image);
                    	p.setProduct_description(product_description);
                    	p.setProduct_price(Double.parseDouble(pro_price));
                    	p.setProduct_quantity(Integer.parseInt(product_quantity));
                    	p.setCategory_id(category_id);
                    	ProductDAOImpl.insertProduct(p);
                        url = "/admin/manager_product.jsp";
                    	} catch (Exception e) {
            				System.out.println(e.getMessage());
            				url = "/WebBH/admin/insert_product.jsp";
            			}
            			break;
                    case "update":
                    	try {
                        Product pu = new Product();
                        pu.setProduct_id(product_id);
                    	pu.setProduct_name(product_name);
                    	pu.setProduct_description(product_description);
                    	pu.setProduct_price(Double.parseDouble(pro_price));
                    	pu.setProduct_quantity(Integer.parseInt(product_quantity));
                    	pu.setCategory_id(category_id);
                    	ProductDAOImpl.updateProduct(pu);
                        url = "/admin/manager_product.jsp";
                    	} catch (Exception e) {
            				System.out.println(e.getMessage());
            				url = "/WebBH/admin/update_product.jsp";
            			}
            			break;
                    default:
                        break;
                }
//            } else {
//                url = "/WebBH/admin/insert_product.jsp";
//            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
