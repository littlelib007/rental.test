package jp.ken.school.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.ken.school.entity.Recode;
import jp.ken.school.model.AdminModel;
import jp.ken.school.model.RecodeModel;

@Controller
@SessionAttributes("adminModel")
public class AdminRecordController {
//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//
//	@SuppressWarnings("unchecked")
//	private static RecodeDAO<Recode> recodeDAO = (RecodeDAO<Recode>)context.getBean("recodeDAO");
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");


	@RequestMapping(value="/admin/recordList",method=RequestMethod.GET)
	public String viewMenu(@ModelAttribute AdminModel adminModel,RecodeModel recodeModel,Model model) throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			List<Recode> recodeList = recodeDAO.allList();
			model.addAttribute("recodeModel",recodeModel);
//			model.addAttribute("recodeList",recodeList);
			model.addAttribute("message","顧客の履歴情報を一覧しています。");
			return "/admin/adminRecord";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	@RequestMapping(value="/admin/recordList",method=RequestMethod.POST)
	public String vagueList(@ModelAttribute AdminModel adminModel,RecodeModel recodeModel,Model model) throws HttpSessionRequiredException,IndexOutOfBoundsException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
			List<Recode> recodeList = null;
			if(recodeModel.getUserName().equals("")){
//				recodeList = recodeDAO.allList();
			}else{
//				List<User> userList = userDAO.getByName(recodeModel.getUserName());
//				if(userList.size() == 0){
//					recodeList = recodeDAO.allList();
					model.addAttribute("message",recodeModel.getUserName() + "さんはの情報は存在しません");
//				}else{
//					User user = (User) userList.get(0);
//					recodeList = recodeDAO.userRecodeList(user.getUserId());
//					model.addAttribute("message",user.getUserName() + "さんの情報を一覧しています。");
				}

			}
//			model.addAttribute("recodeList",recodeList);
			return "/admin/adminRecord";
//		}else{
//			throw new HttpSessionRequiredException(null);
//		}
	}

	public String getAfterDateTime(){
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 14);
		Date day = calendar.getTime();
		return ft.format(day);
	}
	@ExceptionHandler(HttpSessionRequiredException.class)
	public String handleException(HttpSessionRequiredException e){
		return "redirect:/admin";

	}
}
