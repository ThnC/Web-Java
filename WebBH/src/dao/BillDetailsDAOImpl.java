package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.Bill;
import model.BillDetails;
import model.Users;

public class BillDetailsDAOImpl implements BillDetailsDAO {

	@Override
	public void AddBillDetails(BillDetails cthd) {
		Connection conn = DBConnect.getConnection();
		String sql = "insert into bill_details value (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cthd.getBill_details_id());
			ps.setString(2, cthd.getBill().getBill_id());
			ps.setString(3, cthd.getProduct().getProduct_id());
			ps.setInt(4, cthd.getProduct_quantity());
			ps.setDouble(5, cthd.getProduct_price());
			ps.executeUpdate();
			conn.close();

		} catch (Exception ex) {
			Logger.getLogger(UsersDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
		}

	}
	
	
	public ArrayList<BillDetails> getListBilldetails() {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM bill_details";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<BillDetails> listdet = new ArrayList<>();
            while (rs.next()) {
                BillDetails billdet = new BillDetails();
                Users tk = new Users();
                billdet.setBill_details_id(rs.getInt("bill_details_id"));
                billdet.setBill_id(rs.getString("bill_id"));
                billdet.setProduct_id(rs.getString("product_id"));
                billdet.setProduct_quantity(rs.getInt("product_quantity"));
                billdet.setProduct_price(rs.getDouble("product_price"));

                listdet.add(billdet);
            }
            return listdet;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
