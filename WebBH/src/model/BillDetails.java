package model;

public class BillDetails {
	private int bill_details_id;
	private Bill bill;
	private String bill_id;
	private String product_id;
	private Product product;
	private int product_quantity;
	private Double product_price;
	
	
	
	public BillDetails() {
		super();
	}



	public BillDetails(int bill_details_id, Bill bill, String bill_id, String product_id, Product product,
			int product_quantity, Double product_price) {
		super();
		this.bill_details_id = bill_details_id;
		this.bill = bill;
		this.bill_id = bill_id;
		this.product_id = product_id;
		this.product = product;
		this.product_quantity = product_quantity;
		this.product_price = product_price;
	}



	public int getBill_details_id() {
		return bill_details_id;
	}



	public void setBill_details_id(int bill_details_id) {
		this.bill_details_id = bill_details_id;
	}



	public Bill getBill() {
		return bill;
	}



	public void setBill(Bill bill) {
		this.bill = bill;
	}



	public String getBill_id() {
		return bill_id;
	}



	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}



	public String getProduct_id() {
		return product_id;
	}



	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	public int getProduct_quantity() {
		return product_quantity;
	}



	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}



	public Double getProduct_price() {
		return product_price;
	}



	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}



	
	
	
}
