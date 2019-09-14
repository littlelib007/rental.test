package jp.ken.school.admin;

import jp.ken.school.model.AdminModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


@Controller
@SessionAttributes("adminModel")
public class AdminLoginController {

	@ModelAttribute("adminModel")
	public AdminModel setUpAdminForm(){
		return new AdminModel();
	}

	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String login(Model model){
		AdminModel aModel = new AdminModel();
		model.addAttribute("adminModel",aModel);
		return "/admin/admin";
	}
	@RequestMapping(value="/admin",method=RequestMethod.POST)
	public String tologin(@Validated @ModelAttribute AdminModel aModel, BindingResult result, Model model,SessionStatus status){
		if(result.hasErrors()){
			return "/admin/admin";
		}else if( aModel.getAdmin().equals("admin")  && aModel.getAdminpass().equals("pass") ){
			return "redirect:/admin/menu";
		}else{
			model.addAttribute("errorMessage","IDもしくはパスワードが間違っています");
			return "/admin/admin";
		}
	}
	@RequestMapping(value="/admin/logout",method=RequestMethod.GET)
	public String toFinish(@ModelAttribute AdminModel aModel,Model model, SessionStatus status) {
		status.setComplete();
		return "redirect:/admin";
	}

}
