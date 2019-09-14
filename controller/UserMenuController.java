package jp.ken.school.controller;

import java.util.List;

import javax.validation.GroupSequence;
import javax.validation.groups.Default;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jp.ken.school.dao.RecodeDAO;
import jp.ken.school.entity.Recode;
import jp.ken.school.entity.User;
import jp.ken.school.model.ErrorCheckGroup1;
import jp.ken.school.model.RecodeModel;
import jp.ken.school.model.UserModel;

@Controller
@SessionAttributes("userModel")
public class UserMenuController {

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//	@SuppressWarnings("unchecked")
//	private static UserDAO<User> userDAO = (UserDAO<User>)context.getBean("usersDAO");

	@SuppressWarnings("unchecked")
	private RecodeDAO<Recode> recDAO = null;

	@GroupSequence({Default.class,ErrorCheckGroup1.class})
	interface GroupOrder{}


	@RequestMapping(value="/usermenu",method=RequestMethod.GET )
	public String toUserMenu(@RequestParam int userId, @ModelAttribute UserModel uSModel, Model model)throws HttpSessionRequiredException{

//		User usr = userDAO.getById(userId);

//		if ((usr == null) || (uSModel.getEmail()==null)){
//			return "userLogin";
//		}

		UserModel uModel = new UserModel();
//		BeanUtils.copyProperties(usr,uModel);

		if(uSModel.getEmail().equals(uModel.getEmail())
				&& uSModel.getPassword().equals(uModel.getPassword())
				&& uModel.isActiveFlag() == true){

			// 時分秒を省く
			String sBirth = uModel.getBirth();
			String[] birth = sBirth.split(" ");
			uModel.setBirth(birth[0]);

			model.addAttribute("userModel",uModel);

			RecodeModel rModel = new RecodeModel();
			model.addAttribute("recodeModel",rModel);
			model.addAttribute("recList",this.makeUserRecords(userId));
			return "userMenu";

		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	@RequestMapping(value="/usermenu",method=RequestMethod.POST, params="userMenuEdit")
	public String edit(@Validated(GroupOrder.class) @ModelAttribute UserModel uModel,
			BindingResult result,Model model,
			RedirectAttributes rAttr){

		if(result.hasErrors()){
			model.addAttribute("errorMessage","エラーが発生しています");
			return "userMenu";
		}else{
			User usr = new User();
			BeanUtils.copyProperties(uModel,usr);
//			if(userDAO.updateUserData(usr)==1){
				rAttr.addFlashAttribute("infoMessage","会員情報の変更が完了しました");
				int userId = uModel.getUserId();
				String strView ="usermenu?userId=" + String.valueOf(userId);
				return "redirect:/" +strView;
//			}else{
//				model.addAttribute("errorMessage","SQLエラーが発生しています");
//				return "userMenu";
//			}
		}
	}

	@RequestMapping(value="/usermenu",method=RequestMethod.POST, params="userItemDelete")
	public String delete(@RequestParam int id, @ModelAttribute UserModel uModel, Model model,
			RedirectAttributes rAttr){

		if(recDAO.deleteRecodeData(id)==1){
			rAttr.addFlashAttribute("infoMessage","レンタル履歴の取消が完了しました");
			int userId = uModel.getUserId();
			String strView ="usermenu?userId=" + String.valueOf(userId);
			return "redirect:/" +strView;
		}else{
			model.addAttribute("errorMessage","SQLエラーが発生しています");
			return "userMenu";
		}
	}

	@SuppressWarnings("unchecked")
	private List<Recode> makeUserRecords(int id){
//		if(recDAO == null){
//			recDAO = (RecodeDAO<Recode>)context.getBean("recodeDAO");
//		}
		return recDAO.userRecodeList(id);
	}


	@ExceptionHandler(HttpSessionRequiredException.class)
	public String handleException(HttpSessionRequiredException e){
		return "redirect:/user";

	}

}
