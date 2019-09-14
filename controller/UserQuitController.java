package jp.ken.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.ken.school.model.UserModel;

@Controller
@RequestMapping(value="quit")
@SessionAttributes("userModel")
public class UserQuitController {

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");

	@RequestMapping(method=RequestMethod.GET)
	public String toQuit(@RequestParam int userId, @ModelAttribute UserModel uModel,Model model){
		model.addAttribute("userId",userId);
		model.addAttribute("message","退会しますか？");
		return "userQuitConfirm";
	}

	@RequestMapping(method=RequestMethod.POST ,params="back")
	public String toMenu(@RequestParam int userId){
		String strView ="usermenu?userId=" + String.valueOf(userId);
		return "redirect:/" +strView;
	}

	@RequestMapping(method=RequestMethod.POST ,params="quit")
	public String quitUser(@RequestParam int userId, Model model){
//		User user = userDAO.getById(userId);
//		user.setActiveFlag(false);
//		if(userDAO.updateUserData(user) == 1){
			return "userQuitResult";
//		}else{
//			model.addAttribute("message","退会できませんでした。");
//			String strView ="usermenu?userId=" + String.valueOf(user.getUserId());
//			return "redirect:/" +strView;
//		}
	}
}