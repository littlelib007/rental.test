package jp.ken.school.admin;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.ken.school.entity.Item;
import jp.ken.school.model.AdminModel;
import jp.ken.school.model.ErrorCheckGroup1;
import jp.ken.school.model.ItemModel;

@Controller
@SessionAttributes("adminModel")
public class AdminItemAddController {

	@GroupSequence({Default.class,ErrorCheckGroup1.class})
	interface GroupOrder{}

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//	@SuppressWarnings("unchecked")
//	private static ItemDAO<Item> itemDAO = (ItemDAO<Item>)context.getBean("itemsDAO");

	//新規登録画面フォーム
	@RequestMapping(value="/admin/itemList/new",method=RequestMethod.GET)
	public String regist(@ModelAttribute AdminModel adminModel,ItemModel itemModel,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
			model.addAttribute("itemModel",itemModel);
			return "/admin/itemRegist";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

//登録確認
@RequestMapping(value="/admin/itemList/new",method=RequestMethod.POST,params="itemRegistConfirm")
public String toConfirm(@ModelAttribute AdminModel adminModel ,@Validated(GroupOrder.class) @ModelAttribute ItemModel iModel,
								BindingResult result,Model model)throws HttpSessionRequiredException{
	if(result.hasErrors()){
		  return "/admin/itemRegist";
	  }else if(adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass")){
			  Item item = new Item();
			  item.setStatus(3);
			  BeanUtils.copyProperties(iModel,item);
//			  	if(itemDAO.InsertItem(item)){
			  		return "redirect:/admin/itemRegistResult";
			  	}else{
			  		model.addAttribute("errorMessage","SQLエラーが発生しています");
				return "/admin/itemRegist";
			  	}
//	  }else{
//				throw new HttpSessionRequiredException(null);
//		  }
		}

	//登録キャンセル
	@RequestMapping(value="/admin/itemList/new",method=RequestMethod.POST,params="cancel")
	public String toEdit(@ModelAttribute AdminModel adminModel,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
			return "redirect:/admin/itemList";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

//新規登録
@RequestMapping(value="/admin/itemList/new",method=RequestMethod.POST ,params="back")
public String toRegist(@ModelAttribute AdminModel adminModel)throws HttpSessionRequiredException{
	if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
		return "/admin/itemRegist";
	}else{
		throw new HttpSessionRequiredException(null);
	}
}

//新規登録完了
@RequestMapping(value="/admin/itemRegistResult",method=RequestMethod.GET)
public String toRegistResult(@ModelAttribute AdminModel adminModel,ItemModel iModel,Model model)throws HttpSessionRequiredException{
	if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
		model.addAttribute("message","登録が完了しました");
		return "/admin/itemRegistResult";
	}else{
		throw new HttpSessionRequiredException(null);
	}
}
@ExceptionHandler(HttpSessionRequiredException.class)
public String handleException(HttpSessionRequiredException e){
	return "redirect:/admin";
	}
}
