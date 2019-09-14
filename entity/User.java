package jp.ken.school.entity;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity()
@Table(name="UserTable")
public class User {

	@Id
	@Column(name="userId")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int userId;
	private String userName;
	@NotEmpty
	private String email;
	@NotEmpty
	private String password;
	private String gender;
	private String zipcode;
	private String address;
	private int plan;
	private String tel;
	private String birth;
	@Column(name="created_at", updatable=false)
	private String created_at;
	private String updated_at;
	private boolean activeFlag;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="userId",insertable=false,updatable=false)
	private List<Recode> recode = new ArrayList<Recode>();

	public List<Recode> getRecode() {
		return recode;
	}
	public void setRecode(List<Recode> recode) {
		this.recode = recode;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPlan() {
		return plan;
	}

	public void setPlan(int plan) {
		this.plan = plan;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public boolean isActiveFlag() {
		return activeFlag;
	}

	public void setActiveFlag(boolean activeFlag) {
		this.activeFlag = activeFlag;
	}


	/**
     * 登録前処理
     */
    @PrePersist
    public void prePersist() {
        // 登録日、更新日を設定
        Date date = new Date();
        String str = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
        this.created_at = str;
        this.updated_at = str;
    }

    /**
     * 更新前処理
     */
    @PreUpdate
    public void preUpdate() {
        // 更新日を設定
        Date date = new Date();
        String str = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
        this.updated_at = str;
    }

}
