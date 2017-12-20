package model;

import java.util.TreeMap;
import model.Product;;

public class Cart {
	private TreeMap<Product, Integer> list;
	private long cartID;
	private Product product;
	




	public Cart(TreeMap<Product, Integer> list, long cartID, Product product) {
		super();
		this.list = list;
		this.cartID = cartID;
		this.product = product;
	}

	
	
	

	public TreeMap<Product, Integer> getList() {
		return list;
	}





	public void setList(TreeMap<Product, Integer> list) {
		this.list = list;
	}





	public long getCartID() {
		return cartID;
	}





	public void setCartID(long cartID) {
		this.cartID = cartID;
	}





	public Product getProduct() {
		return product;
	}





	public void setProduct(Product product) {
		this.product = product;
	}





	public Cart() {
		list = new TreeMap<>();
		cartID = System.currentTimeMillis();

	}


	public void addToCart(Product sp, int product_quantity) {
		boolean bln = list.containsKey(sp);
		if (bln) {
			int sl = list.get(sp);
			product_quantity += sl;
			list.put(sp, product_quantity);
		} else {
			list.put(sp, product_quantity);
		}

	}

	public void supToCart(Product sp, int product_quantity) {
		boolean bln = list.containsKey(sp);
		if (bln) {
			int sl = list.get(sp);
			product_quantity = sl - product_quantity;
			if (product_quantity <= 0) {
				list.remove(sp);
			} else {
				list.remove(sp);
				list.put(sp, product_quantity);
			}

		}

	}

	public void removeToCart(Product sp) {
		boolean bln = list.containsKey(sp);
		if (bln) {
			list.remove(sp);
		}

	}

	public int CountProduct() {
		return list.size();
	}

	public double TotalCart() {
		double count = 0;
		


//	count += getValue().getProduct().getProduct_price() * getValue().getProduct_quantity();

		
		return count;
	}

}
