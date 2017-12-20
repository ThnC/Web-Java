package dao;


import java.util.ArrayList;

import model.Category;


public interface CategoryDAO {

	// load ds cy cha
	public ArrayList<Category> getListCategoryCha();

	// load ds cy con
	public ArrayList<Category> getListCategoryCon(Long category_id);
	
	// thêm mới dữ liệu
    public boolean insertCategory(Category c);
    
    //cap nhat
    public boolean updateCategory(Category c);
    
 // xóa dữ liệu
    public boolean deleteCategory(Long category_id);



}
