package jp.ken.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import jp.ken.school.model.UserModel;

@Controller
@SessionAttributes("userModel")
public class UserLoginController {
//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");

	@ModelAttribute("userModel")
	public UserModel setUpUserForm(){
		return new UserModel();
	}

	@RequestMapping(value="/user",method=RequestMethod.GET)
	public String login(Model model){
		UserModel aModel = new UserModel();
		model.addAttribute("userModel",aModel);
		return "userLogin";
	}

	@RequestMapping(value="/user",method=RequestMethod.POST)
	public String tologin(@Validated @ModelAttribute UserModel uModel, BindingResult result, Model model){
		//フォームの値を受け取る
		String email=uModel.getEmail();
		String password=uModel.getPassword();
		//フォームの値をもとにDBから値を検索
//		User user = (User)userDAO.getByEmail(email);
		if(result.hasErrors()){
			return "userLogin";
			//フォームの値とDBの値を比較
//		}else if(email.equals(((User) user).getEmail())  && password.equals(((User) user).getPassword())){
//			return "redirect:/usermenu?userId="+((User) user).getUserId();
		}else{
//			model.addAttribute("message","IDもしくはパスワードが間違っています");
			return "userMenu";
		}
	}

	@RequestMapping(value="/user/logout",method=RequestMethod.GET)
	public String toFinish(@ModelAttribute UserModel uModel, Model model, SessionStatus status) {
		status.setComplete();
		return "redirect:/user";
	}


}
