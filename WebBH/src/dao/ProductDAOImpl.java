package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Category;
import model.Product;


public class ProductDAOImpl implements ProductDAO {

	// get DS sp dá»±a vĂ o mĂ£ cy
	public ArrayList<Product> getListProductByCategory(Long category_id) {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * from product WHERE category_id = '" + category_id + "'";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sp = new Product();
				sp.setCategory_id(rs.getString("category_id"));
				sp.setProduct_id(rs.getString("product_id"));
				sp.setProduct_name(rs.getString("product_name"));
				sp.setProduct_image(rs.getString("product_image"));
				sp.setProduct_quantity(rs.getInt("product_quantity"));
				sp.setProduct_description(rs.getString("product_description"));
				sp.setProduct_price(rs.getDouble("product_price"));

				arr.add(sp);
			}
			conn.close();
		} catch (Exception ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return arr;
	}

	// Chi tiet sp


	public Product getProduct_detail(String product_id) {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE product_id = '" + product_id + "'";
		Product sp = new Product();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp.setCategory_id(rs.getString("category_id"));
				sp.setProduct_id(rs.getString("product_id"));
				sp.setProduct_name(rs.getString("product_name"));
				sp.setProduct_image(rs.getString("product_image"));
				sp.setProduct_quantity(rs.getInt("product_quantity"));
				sp.setProduct_description(rs.getString("product_description"));
				sp.setProduct_price(rs.getDouble("product_price"));

			}
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return sp;

	}


	public ArrayList<Product> getList() {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * from product ";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sp = new Product();
				sp.setProduct_id(rs.getString("category_id"));
				sp.setProduct_name(rs.getString("product_name"));
				sp.setProduct_image(rs.getString("product_image"));
				sp.setProduct_quantity(rs.getInt("product_quantity"));
				sp.setProduct_description(rs.getString("product_description"));
				sp.setProduct_price(rs.getDouble("product_price"));

				arr.add(sp);
			}
			conn.close();
		} catch (Exception ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return arr;
	}

	@Override
	public ArrayList<Product> getListByPage(ArrayList<Product> arr, int start, int end) {
		ArrayList<Product> list = new ArrayList<>();
		for(int i = start; i < end; i++) {
			list.add(arr.get(i));
		}
		return list;
	}
	
	
	public static ArrayList<Product> getListProductAll() {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM product";
		ArrayList<Product> arrs = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setCategory_id(rs.getString("category_id"));
				prod.setProduct_id(rs.getString("product_id"));
				prod.setProduct_name(rs.getString("product_name"));
				prod.setProduct_image(rs.getString("product_image"));
				prod.setProduct_price(rs.getDouble("product_price"));
				prod.setProduct_quantity(rs.getInt("product_quantity"));
				prod.setProduct_description(rs.getString("product_description"));
				arrs.add(prod);
			}
			conn.close();

		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return arrs;

	}
	
	
	public static boolean insertProduct(Product p) {
	    try {
	         Connection conn = DBConnect.getConnection();
	         String sql = "INSERT INTO webbh.product(product_name, product_image, product_quantity, product_description, product_price,category_id) VALUES(?,?,?,?,?,?)";
	         PreparedStatement px = conn.prepareCall(sql);
	         px.setString (1, p.getProduct_name());
	         px.setString (2, p.getProduct_image());
	         px.setInt (3, p.getProduct_quantity());
	         px.setString (4, p.getProduct_description());
	         px.setDouble (5, p.getProduct_price());
	         px.setString(6, p.getCategory_id());
	         int temp = px.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	         return false;
	    }
	}
	
    

public static boolean updateProduct(Product p) {
    Connection connection = DBConnect.getConnection();
    String sql = "UPDATE product set product_name = ?, product_quantity=?,product_description=?,product_price=?, category_id=? WHERE product_id = ?";
    try {
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, p.getProduct_name());
        ps.setInt(3, p.getProduct_quantity());
        ps.setString(4, p.getProduct_description());
        ps.setDouble(2, p.getProduct_price());
        ps.setString(5, p.getCategory_id());
        ps.setString(6, p.getProduct_id());
        int temp = ps.executeUpdate();
        return temp == 1;
   } catch (Exception e) {
   	System.out.println(e.getMessage());
        return false;
   }
}
    


public static boolean deleteProduct(String product_id) {
    Connection connection = DBConnect.getConnection();
    String sql = "DELETE FROM Product WHERE product_id = ?";
    try {
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, product_id);
        return ps.executeUpdate() == 1;
    } catch (SQLException ex) {
        Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
    }
    return false;
}



public static void main(String[] args) {
//	Product p = new Product();
//	p.setCategory_id(2+"");
//	p.setProduct_description("b");
//	p.setProduct_id(14+"");
//	p.setProduct_image("");
//	p.setProduct_name("abc");
//	p.setProduct_price(1.1);
//	p.setProduct_quantity(2);
	System.out.println(getListProductAll());
}
	
	
}
