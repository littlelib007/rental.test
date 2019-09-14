package jp.ken.school;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.ken.school.entity.Item;
import jp.ken.school.model.ItemModel;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
//	private static ApplicationContext context = new ClassPathXmlApplicationContext("teamB.xml");
//	@SuppressWarnings("unchecked")
//	private static ItemDAO<Item> itmDAO= (ItemDAO<Item>)context.getBean("itemsDAO");

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		ItemModel iModel = new ItemModel();
//		List<Item> list = itmDAO.allList();
		model.addAttribute("itemModel",iModel);
//		model.addAttribute("itemList", list);
		return "top";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String homeDisp(@ModelAttribute ItemModel iModel,BindingResult result, Model model) {
		List<Item>list=null;
			if(!iModel.getItemName().equals("")){
//				list=itmDAO.getByName(iModel.getItemName());
			}else if (!iModel.getItemName().equals("")){
				list=new ArrayList<Item>();
			}else{
//				list=itmDAO.allList();
			}
			model.addAttribute("itemList",list);
			return "top";
		}

}
