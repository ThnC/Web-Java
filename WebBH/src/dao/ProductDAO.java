package dao;

import java.util.ArrayList;

import model.Product;

public interface ProductDAO {

	// lấy DS sp theo cy_id
	public ArrayList<Product> getListProductByCategory(Long category_id);

	// hiển thị tt sp

	public Product getProduct_detail(String product_id);
	
	public ArrayList<Product> getList();
	
	
	public ArrayList<Product> getListByPage(ArrayList<Product> arr, int start,int end);
}
