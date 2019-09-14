package jp.ken.school.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="RecodeTable")
public class Recode {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int userId;
	private int itemCode;
	private int amount;
	private String rental_at;
	private String return_at;

	@OneToOne
	@JoinColumn(name="itemCode",insertable=false,updatable=false)
	private Item item;

    public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	@OneToOne
	@JoinColumn(name="userId",insertable=false,updatable=false)
	private User user;

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
