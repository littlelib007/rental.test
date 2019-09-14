package jp.ken.school.model;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class ItemModel implements Serializable{

	private int itemCode;

	@NotEmpty(message="名前が未入力です")
	private String itemName;
	private String itemFileName;
	@NotEmpty(message="商品説明が未入力です")
	private String itemDetail;
	@Range(message="在庫数は1以上10以下です",min=1, max=10)
	private int stock;
	@NotEmpty(message="リリース日が未入力です")
	@Pattern(regexp="^(\\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$",
	groups=ErrorCheckGroup1.class,
	message="yyyy-mm-dd形式で入力してください")
	private String release_at;
	@NotEmpty(message="入荷日が未入力です")
	@Pattern(regexp="^(\\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$",
	groups=ErrorCheckGroup1.class,
	message="yyyy-mm-dd形式で入力してください")
	private String arrival_at;
	@NotEmpty(message="作者が未入力です")
	private String directorName;
	@Range(message="収録時間は1以上300以下です",min=1, max=300)
	private int recTime;//収録時間
	@NotEmpty(message="カテゴリーが未入力です")
	private String category;
	private int amount;


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
	public String getDirectorName() {
		return directorName;
	}
	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}
	public int getRecTime() {
		return recTime;
	}
	public void setRecTime(int recTime) {
		this.recTime = recTime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}


}
