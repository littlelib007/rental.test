package jp.ken.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.ken.school.model.UserModel;

@Controller
@RequestMapping(value="userRegistResult")
@SessionAttributes("userModel")
public class UserRegistResultController {

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");

	@RequestMapping(method=RequestMethod.GET)
	public String toRegistResult(@ModelAttribute UserModel uModel,Model model){
		model.addAttribute("message","会員登録が完了しました");
		String email = uModel.getEmail();
//		User usr = userDAO.getByEmail(email);
//		model.addAttribute("user",usr);
		return "userRegistResult";
	}



}
