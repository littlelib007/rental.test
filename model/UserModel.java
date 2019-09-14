package jp.ken.school.model;

import java.io.Serializable;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserModel implements Serializable {

	private int userId;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="名前を省略することはできません")
	private String userName;


	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="メールアドレスを省略することはできません")
	@Email(groups=ErrorCheckGroup1.class,
			message="メールアドレスではありません")
	private String email;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="パスワードを省略することはできません")
	@Size(min=4,max=16,groups=ErrorCheckGroup1.class,
		message="パスワードは{min}文字以上{max}文字以下です")
	@Pattern(regexp="[a-zA-Z0-9]*",groups=ErrorCheckGroup1.class,
		message="パスワードは英数である必要があります")
	private String password;

	private String gender;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="郵便番号を省略することはできません")

	@Pattern(regexp="^\\d{3}\\-?\\d{4}$",
	groups=ErrorCheckGroup1.class,
	message="郵便番号の形式ではありません")
	private String zipcode;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="住所を省略することはできません")
	private String address;

	private int plan;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="電話番号を省略することはできません")
	@Pattern(regexp="^\\d{10,12}$",
		groups=ErrorCheckGroup1.class,
		message="携帯電話番号の場合はハイフンなしで入力してください。")

	private String tel;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="生年月日を省略することはできません")
	@Pattern(regexp="^(\\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$",
		groups=ErrorCheckGroup1.class,
		message="yyyy-mm-dd形式で入力してください")
	private String birth;

	private boolean activeFlag;

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getGender() {
		return gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public String getAddress() {
		return address;
	}
	public int getPlan() {
		return plan;
	}
	public String getTel() {
		return tel;
	}
	public String getBirth() {
		return birth;
	}
	public boolean getActiveFlag() {
		return activeFlag;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPlan(int plan) {
		this.plan = plan;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setActiveFlag(boolean activeFlag) {
		this.activeFlag = activeFlag;
	}
	public boolean isActiveFlag() {
		return activeFlag;
	}
}