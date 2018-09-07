package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import entity.operator;
import service.operator_service;
import service.type_service;
import utils.SearchInfo;
import utils.jsonInfo;



@Controller
@RequestMapping("operator")
public class operator_controller {
	@Autowired
	operator_service service;
	
	@RequestMapping("operator-list")
	public void index(ModelMap m,String txt,SearchInfo info) {	
		if(txt==null) {
			txt="";
		}
		String where="";
		where=" where operator.name like '%"+txt+"%'"; 
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));	
	}
	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(operator o) {
		service.insert(o);
		return new jsonInfo(5, "");
	}
	@RequestMapping("delete")
	public String insert(int id) {
		service.delete(id);
		return "redirect:operator-list";
	}
	@RequestMapping("deleteall")
	public String deleteall(String ids,SearchInfo info) {
		info.setIds(ids);
		service.deleteall(info);
			return "redirect:operator-list";
	}
	@RequestMapping("update")
	public @ResponseBody jsonInfo update(operator o) {
		service.update(o);
		return new jsonInfo(5, "");
	}
	@RequestMapping("supdate")
	public @ResponseBody jsonInfo supdate(operator o) {
		service.supdate(o);  
		return new jsonInfo(5, "");
	}
	
	@RequestMapping("add")
	public String add(ModelMap m) {
		m.put("sexs",  operator.sexs);
		m.put("powers", operator.powers);

			return "operator/operator-add";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {
		m.put("info", service.getById(id));
		
		return add(m);
	}
}
