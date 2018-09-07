package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import entity.orders_status;
import service.orders_status_service;
import utils.SearchInfo;
import utils.jsonInfo;



@Controller
@RequestMapping("orders_status")
public class orders_status_controller {
	@Autowired
	orders_status_service service;
	@RequestMapping("orders_status")
	public void index(ModelMap m,String txt,SearchInfo info) {	
		if(txt==null) {
			txt="";
		}
		String where="";
		where=" where orders_status.name like '%"+txt+"%'"; 
		System.out.println(txt);
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));
		System.out.println(service.select(info).size());
	}
	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(orders_status o) {
		service.insert(o);
		return new jsonInfo(5, "");
	}

	@RequestMapping("update")
	public @ResponseBody jsonInfo update(orders_status o) {
		service.update(o);
		return new jsonInfo(5, "");
	}
	
	@RequestMapping("add")
	public String add(ModelMap m) {
	
			return "orders_status/orders_status-add";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {
		m.put("info", service.getById(id));
		
		return add(m);
	}
}
