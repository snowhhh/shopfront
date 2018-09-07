package controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.operator;
import entity.product;
import service.product_service;
import service.type_service;
import utils.SearchInfo;
import utils.jsonInfo;


	@Controller
	@RequestMapping("product")
	public class product_controller {
		@Autowired
		product_service service;
		@Resource(name="type_serviceImpl")
		type_service tservice;
		@RequestMapping("product-list")
		public void index(ModelMap m,String txt,SearchInfo info) {	
			if(txt==null) {
				txt="";
			}
			String where="";
			where=" where fullname like '%"+txt+"%'";
			System.out.println(txt);
			info.setWhere(where);
			m.put("search", info);	

			m.put("list",service.select(info));	
		}
		@RequestMapping("insert")
		public @ResponseBody jsonInfo insert(product p) {
			service.insert(p);
			return new jsonInfo(5, "");
		}
		@RequestMapping("delete")
		public String insert(int id) {
			service.delete(id);
			return "redirect:product-list";
		}
		@RequestMapping("deleteall")
		public String deleteall(String ids,SearchInfo info) {
			info.setIds(ids);
			service.deleteall(info);
				return "redirect:product-list";
		}
		@RequestMapping("update")
		public @ResponseBody jsonInfo update(product p) {
			service.update(p);
			return new jsonInfo(5, "");
		}
		@RequestMapping("supdate")
		public void supdate(product p) {
			service.supdate(p);  		
		}
		
		@RequestMapping("add")
		public String add(ModelMap m) {
			m.put("statuss",product.statuss);
			m.put("prioritys",product.prioritys);
			m.put("typerow", tservice.sselect());
				return "product/product-add";
		}
		@RequestMapping("edit")
		public String edit(int id,ModelMap m) {
			m.put("info", service.getById(id));
			System.out.println(service.getById(id).getStatus_Name());
			return add(m);
		}
	}

