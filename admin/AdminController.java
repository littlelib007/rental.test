package jp.ken.school.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.ken.school.model.AdminModel;

@Controller
@SessionAttributes("adminModel")
public class AdminController {

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");
//	@SuppressWarnings("unchecked")
//	private static ItemDAO<Item> itemDAO = (ItemDAO<Item>)context.getBean("itemsDAO");
//	@SuppressWarnings("unchecked")
//	private static RecodeDAO<Recode> recodeDAO = (RecodeDAO<Recode>)context.getBean("recodeDAO");

	@RequestMapping(value="/admin/menu",method=RequestMethod.GET)
	public String viewMenu(@ModelAttribute AdminModel adminModel,Model model) throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			List<User> userList = userDAO.allList();
//			List<Item> itemList = itemDAO.allList();
//			List<Recode> recodeList = recodeDAO.allList();
			System.out.println("userList=");
//			System.out.println("userList=>"+userList.size());
//			System.out.println("itemList=>"+itemList.size());
//			System.out.println("recodeList=>"+recodeList.size());
//
//			model.addAttribute("userCount",userList.size());
//			model.addAttribute("itemCount",itemList.size());
//			model.addAttribute("recodeCount",recodeList.size());

			return "/admin/adminMenu";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	@ExceptionHandler(HttpSessionRequiredException.class)
	public String handleException(HttpSessionRequiredException e){
		return "redirect:/admin";

	}
}
