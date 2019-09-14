package jp.ken.school.model;

public class RecodeModel {

	private String userName;
	private int userId;
	private int itemCode;
	private int amount;
	private String rental_at;
	private String return_at;
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRental_at() {
		return rental_at;
	}

	public void setRental_at(String rental_at) {
		this.rental_at = rental_at;
	}

	public String getReturn_at() {
		return return_at;
	}

	public void setReturn_at(String return_at) {
		this.return_at = return_at;
	}


}
