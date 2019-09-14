package jp.ken.school.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ItemTable")
public class Item {
	@Id
	@Column(name="itemCode")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int itemCode;
	private String itemName;
	private String itemFileName;
	private String itemDetail;
	private int stock;
	private String release_at;
	private String arrival_at;
	private String directorName;
	private int recTime;//収録時間
	private String category;
	private int status;


	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="itemCode",insertable=false,updatable=false)
	private List<Recode> recode = new ArrayList<Recode>();

	public List<Recode> getRecode() {
		return recode;
	}
	public void setRecode(List<Recode> recode) {
		this.recode = recode;
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


	public String getItemFileName() {
		return itemFileName;
	}
	public void setItemFileName(String itemFileName) {
		this.itemFileName = itemFileName;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}

