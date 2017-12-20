
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Value;

public class ChartDAO {

    public ArrayList<Value> getAll() {
        try {
        	CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
            ProductDAOImpl productDAO = new ProductDAOImpl();
            ArrayList<Value> list = new ArrayList<>();
            for (Category category : categoryDAO.getListCategory()) {
                list.add(new Value(category.getCategory_name(),
                        productDAO.getListProductByCategory(category.getCategory_id()).size()));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ChartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
//        System.out.println(new ChartDAO().getAll());
        for(Value v : new ChartDAO().getAll()){
            System.out.println(v.getName() + " - "+v.getValue());
        }
    }

}
