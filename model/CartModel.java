package jp.ken.school.model;

import java.io.Serializable;


public class CartModel implements Serializable{

	private int itemCode;
	private String itemName;
	private String itemFileName;
	private String itemDetail;
	private int stock;
	private String release_at;
	private String arrival_at;

	private int amount;

	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getRelease_at() {
		return release_at;
	}
	public void setRelease_at(String release_at) {
		this.release_at = release_at;
	}
	public String getArrival_at() {
		return arrival_at;
	}
	public void setArrival_at(String arrival_at) {
		this.arrival_at = arrival_at;
	}
	public String getItemFileName() {
		return itemFileName;
	}
	public void setItemFileName(String itemFileName) {
		this.itemFileName = itemFileName;
	}

}
