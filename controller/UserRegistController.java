package jp.ken.school.controller;

import javax.validation.GroupSequence;
import javax.validation.groups.Default;

import jp.ken.school.model.ErrorCheckGroup1;
import jp.ken.school.model.UserModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value="userRegist")
@SessionAttributes("userModel")
public class UserRegistController {

	@GroupSequence({Default.class,ErrorCheckGroup1.class})
	interface GroupOrder{}

	@ModelAttribute("userModel")
	public UserModel setUpUserModel(){
		return new UserModel();
	}

	@RequestMapping(method=RequestMethod.GET)
	public String toRegist(){
		return "userRegist";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String toRegistConfirm(@Validated(GroupOrder.class) @ModelAttribute UserModel uModel,BindingResult result,Model model){
		if(result.hasErrors()){
			model.addAttribute("errorMessage","エラーが発生しています");
			return "userRegist";
		}else{
			return "redirect:/userregistconfirm";
		}
	}

}
