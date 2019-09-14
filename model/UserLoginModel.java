package jp.ken.school.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserLoginModel {

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="メールアドレスを省略することはできません")
	@Email(groups=ErrorCheckGroup1.class,
			message="メールアドレスではありません")
	private String email;

	@NotEmpty(groups=ErrorCheckGroup1.class,
			message="パスワードを省略することはできません")
//	@Size(min=8,max=16,groups=ErrorCheckGroup1.class,
//		message="パスワードは{min}文字以上{max}文字以下です")
	@Pattern(regexp="[a-zA-Z0-9]*",groups=ErrorCheckGroup1.class,
		message="パスワードは英数である必要があります")
	private String password;

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
}
