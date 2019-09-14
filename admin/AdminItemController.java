package jp.ken.school.admin;

import java.util.ArrayList;
import java.util.List;

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

import jp.ken.school.entity.Item;
import jp.ken.school.model.AdminModel;
import jp.ken.school.model.ItemModel;

@Controller
//@SessionAttributes({"adminModel","itemModel"})
@SessionAttributes("adminModel")
public class AdminItemController {

//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//	@SuppressWarnings("unchecked")
//	private static ItemDAO<Item> itemDAO = (ItemDAO<Item>)context.getBean("itemsDAO");

//	@ModelAttribute("itemModel")
//	public ItemModel setUpItemnForm(){
//		return new ItemModel();
//	}

	//在庫一覧表示
	@RequestMapping(value="/admin/itemList", method=RequestMethod.GET)
	public String itemList(@ModelAttribute AdminModel adminModel,Model model,ItemModel itemModel) throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			List<Item> list = itemDAO.allList();
			model.addAttribute("itemModel",itemModel);
//			model.addAttribute("itemList",list);
			return "/admin/itemList";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	//あいまい検索の処理
	@RequestMapping(value="/admin/itemList", method = RequestMethod.POST,params="search")
	public String homeDisp(@Validated @ModelAttribute AdminModel adminModel,ItemModel iModel,BindingResult result, Model model)
	throws HttpSessionRequiredException{
	if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
		List<Item>list=null;
			if(!result.hasErrors()){
				if(!iModel.getItemName().equals("")){
//					list=itemDAO.getByName(iModel.getItemName());
					model.addAttribute("itemList",list);
				}else if (iModel.getItemName().equals("")){
//					list = itemDAO.allList();
					}else{
						list=new ArrayList<Item>();
					}
				model.addAttribute("itemModel",iModel);
				model.addAttribute("itemList",list);
			}
			return "/admin/itemList";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}


	//商品編集画面
	@RequestMapping(value="/admin/edit",method=RequestMethod.GET)
	public String toEdit(@ModelAttribute AdminModel adminModel,
								@RequestParam int paramId,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			Item item = (Item)itemDAO.getById(paramId);
			ItemModel iModel = new ItemModel();
//			BeanUtils.copyProperties(item, iModel);
			model.addAttribute("itemModel", iModel);
			return "/admin/itemEdit";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	//商品編集
	@RequestMapping(value="/admin/edit",method=RequestMethod.POST,params="edit")
	public String edit(@RequestParam int itemCode, @Validated
							@ModelAttribute AdminModel adminModel,ItemModel iModel,
							BindingResult result,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
			Item item = new Item();
			BeanUtils.copyProperties(iModel, item);
			item.setItemCode(iModel.getItemCode());
			item.setStatus(1);
//			if(/*itemDAO.updateItem(item) */){
				model.addAttribute("message", "商品内容を変更しました。");
				return "redirect:/admin/itemList";
			}else{
				model.addAttribute("errorMessage", "エラー");
				return "/admin/itemEdit";
			}
//		}else{
//			throw new HttpSessionRequiredException(null);
//		}
	}
	//商品編集の"キャンセル"
	@RequestMapping(value="/admin/edit",method=RequestMethod.POST,params="cancel")
	public String toEdit(@ModelAttribute AdminModel adminModel,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
			return "redirect:/admin/itemList";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	//削除確認画面
	@RequestMapping(value="/admin/delete",method=RequestMethod.GET)
	public String toDelete(@ModelAttribute AdminModel adminModel,@RequestParam int paramId,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			Item item = (Item)itemDAO.getById(paramId);
//			model.addAttribute("deleteItemData",item);
			return "/admin/itemDelete";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	//削除確認画面の処理
	@RequestMapping(value="/admin/delete",method=RequestMethod.POST,params="delete")
	public String delete(@ModelAttribute AdminModel adminModel,
								@RequestParam int itemCode,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
//			Item item = itemDAO.getById(itemCode);
//			item.setStatus(2);
//			if(itemDAO.updateItem(item) == 1){
				return "redirect:/admin/itemList";
			}else{
				model.addAttribute("errorMessage","削除できませんでした。");
				return "admin/itemDelete";
			}
//			}else{
//				throw new HttpSessionRequiredException(null);
//			}

	}

	//削除確認画面の"キャンセル"
	@RequestMapping(value="/admin/delete",method=RequestMethod.POST,params="cancel")
	public String Cancel(@ModelAttribute AdminModel adminModel,Model model)throws HttpSessionRequiredException{
		if( adminModel.getAdmin().equals("admin")  && adminModel.getAdminpass().equals("pass") ){
			return "redirect:/admin/itemList";
		}else{
			throw new HttpSessionRequiredException(null);
		}
	}

	@ExceptionHandler(HttpSessionRequiredException.class)
	public String handleException(HttpSessionRequiredException e){
		return "redirect:/admin";
	}
	@ExceptionHandler(NullPointerException.class)
	public String handleException(NullPointerException e){
		return "redirect:/admin";
	}
}