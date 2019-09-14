package jp.ken.school.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.ken.school.entity.User;
import jp.ken.school.model.UserModel;

@Controller
@RequestMapping(value="userregistconfirm")
@SessionAttributes("userModel")
public class UserRegistConfirmController {

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//	@SuppressWarnings("unchecked")
//	private static ItemDAO<Item> itemDAO = (ItemDAO<Item>)context.getBean("itemsDAO");
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");

	@RequestMapping(method=RequestMethod.GET)
	public String toConfirm(Model model){
		model.addAttribute("message","上記内容で登録します");
		return "userRegistConfirm";
	}

	@RequestMapping(method=RequestMethod.POST ,params="back")
	public String toRegist(){
		return "redirect:/userRegist";
	}

	@RequestMapping(method=RequestMethod.POST ,params="regist")
	public String regist(@ModelAttribute UserModel uModel,Model model){
		User usr = new User();
		BeanUtils.copyProperties(uModel,usr);

//		if(userDAO.insertUserData(usr)){
			return "redirect:/userRegistResult";
//		}else{
//			model.addAttribute("errorMessage","SQLエラーが発生しています");
//			return "userRegistConfirm";
//		}
	}

}
