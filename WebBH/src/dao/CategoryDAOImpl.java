 package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.Category;


public class CategoryDAOImpl {
    public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategory_id(rs.getLong("category_id"));
            category.setCategory_name(rs.getString("category_name"));
            list.add(category);
        }
        return list;
    }

	public static ArrayList<Category> getListCategoryAll() {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM `category`";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category cy = new Category();
				cy.setCategory_id(rs.getLong("category_id"));
				cy.setCategory_name(rs.getString("category_name"));
				cy.setCategory_cha(rs.getString("category_cha"));
				arr.add(cy);
			}
			conn.close();

		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return arr;

	}
	public static Category getListCategoryAllByid(Long id) {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM `category` where category_id="+id;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Category cv = new Category();
			if (rs.next()) {
				cv.setCategory_id(rs.getLong("category_id"));
				cv.setCategory_name(rs.getString("category_name"));
				cv.setCategory_cha(rs.getString("category_cha"));
			}
			conn.close();
			return cv;

		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}

	}
	public static ArrayList<Category> getListCategoryCha() {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM `category` WHERE category_cha = ''";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category cy = new Category();
				cy.setCategory_id(rs.getLong("category_id"));
				cy.setCategory_name(rs.getString("category_name"));
				cy.setCategory_cha(rs.getString("category_cha"));
				arr.add(cy);
			}
			conn.close();

		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return arr;

	}

	public static ArrayList<Category> getListCategoryCon(Long category_id) {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM category WHERE category_cha='" + category_id + "'";
		ArrayList<Category> arr = new ArrayList<>(); 
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category cy = new Category();
				cy.setCategory_id(rs.getLong("category_id"));
				cy.setCategory_name(rs.getString("category_name"));
				cy.setCategory_cha(rs.getString("category_cha"));
				arr.add(cy);
			}
			conn.close();

		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return arr;
	}
	


	public static boolean insertCategory(String cat_name) {
	    try {
	         Connection connection = DBConnect.getConnection();
	         String sql = "INSERT INTO webbh.category(category_name, category_cha) VALUES('"+cat_name+"', '"+""+"')";
	         PreparedStatement ps = connection.prepareCall(sql);
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	
    

public static boolean updateCategory(Category c) {
    Connection connection = DBConnect.getConnection();
    String sql = "UPDATE category set category_name = ?, category_cha =? WHERE category_id  = ?";
    try {
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, c.getCategory_name());
        ps.setLong(3, c.getCategory_id());
        ps.setString(2, c.getCategory_cha());
        return ps.executeUpdate() == 1;
    } catch (SQLException ex) {
        Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
    }
    return false;
}


public static boolean deleteCategory(Long category_id) {
    Connection connection = DBConnect.getConnection();
    String sql = "DELETE FROM category WHERE category_id = ?";
    try {
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, category_id);
        return ps.executeUpdate() == 1;
    } catch (SQLException ex) {
        Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
    }
    return false;
}

public static void main(String[] args) {
//	Category c = new Category(3l,"abc 2","2");
}
    
}


