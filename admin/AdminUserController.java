package jp.ken.school.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import jp.ken.school.model.AdminModel;

@Controller
@SessionAttributes("adminModel")
public class AdminUserController {
//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");

	//ユーザー一覧表示
	@RequestMapping(value="/admin/userList",method=RequestMethod.GET)
	public String toUserList(@ModelAttribute AdminModel adminModel,Model model,BindingResult result) throws HttpSessionRequiredException{
		if(result.hasErrors()){
			return "redirect:/admin";
		}else if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			List<User> userList = userDAO.allList();
//			model.addAttribute("userList",userList);
			model.addAttribute("message","顧客情報を一覧しています。");
			return "/admin/adminUserList";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	@RequestMapping(value="/admin/quit",method=RequestMethod.GET)
	public String quitUser(@RequestParam int userId,Model model){
//		User user = userDAO.getById(userId);
//		user.setActiveFlag(false);

//		if(userDAO.updateUserData(user) == 1){
//			List<User> userList = userDAO.allList();
//			model.addAttribute("userList",userList);
			model.addAttribute("message","1件のユーザーを削除しました。");
			return "/admin/adminUserList";
//		}else{
//			List<User> userList = userDAO.allList();
//			model.addAttribute("userList",userList);
//			model.addAttribute("message","ユーザーを削除できませんでした。");
//			return "/admin/adminUserList";
//		}
	}

	@ExceptionHandler(HttpSessionRequiredException.class)
	public String handleException(HttpSessionRequiredException e){
		ModelAndView model = new ModelAndView("errorMessage");
		model.addObject("errorMessage","IDとパスワードを入力してください。");
		return "redirect:/admin";

	}
}
