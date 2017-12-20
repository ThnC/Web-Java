package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.Users;

public class UsersDAOImpl implements UsersDAO {

	@Override
	public boolean CheckUsers(String userEmail) {
		Connection conn = DBConnect.getConnection();
		String sql = "select userEmail from users where userEmail = '" + userEmail + "'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
			conn.close();
		} catch (SQLException ex) {

			Logger.getLogger(UsersDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	@Override
	public void AddUsers(Users tk) {
		Connection conn = DBConnect.getConnection();
		String sql = "insert into users value (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, tk.getUserID());
			ps.setString(2, tk.getUserName());
			ps.setString(3, tk.getUserEmail());
			ps.setString(4, tk.getUserPass());
			ps.setInt(5, tk.getUserRole());
			ps.executeUpdate();
			conn.close();

		} catch (Exception ex) {
			Logger.getLogger(UsersDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

	@Override
	public boolean CheckLogin(String userEmail, String userPass) {
		Connection conn = DBConnect.getConnection();
		String sql = "select * from users where userEmail = '" + userEmail + "' and userPass = '" + userPass + "'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}

		return false;
	}

	@Override
	public Users getUsers(String userEmail) {
		Connection conn = DBConnect.getConnection();
		String sql = "select * from users where userEmail = '" + userEmail + "'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users tk = new Users();
				tk.setUserID(rs.getString("userID"));
				tk.setUserEmail(rs.getString("userEmail"));
				tk.setUserName(rs.getString("userName"));
				return tk;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
		
	}
	
//    public Users getUser(long userID) {
//        try {
//            Connection connection = DBConnect.getConnection();
//            String sql = "SELECT * FROM users WHERE userID = ?";
//            PreparedStatement ps = connection.prepareCall(sql);
//            ps.setLong(1, userID);
//            ResultSet rs = ps.executeQuery();
//            Users u = new Users();
//            while (rs.next()) {
//                u.setUserEmail(rs.getString("user_Email"));
//            }
//            return u;
//        } catch (SQLException ex) {
//            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

}
