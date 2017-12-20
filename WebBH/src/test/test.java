package test;

import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;

public class test {

	public static void main(String[] args) {
		CategoryDAOImpl cy = new CategoryDAOImpl();
		ProductDAOImpl sp = new ProductDAOImpl();
		// System.out.println(cy.getListCategoryCon("1").size());
		System.out.println(sp.getProduct_detail("1").getProduct_name());
	}
}
