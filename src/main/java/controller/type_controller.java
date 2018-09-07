package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import entity.type;
import service.type_service;
import utils.SearchInfo;
import utils.jsonInfo;

@Controller
@RequestMapping("type")
public class type_controller {
	@Autowired
	type_service service;
	@RequestMapping("type_list")
	public void index(ModelMap m,Integer parentid,SearchInfo info) {	
if(parentid==null) parentid=0;
		
		m.put("parentid", parentid);
		if(parentid>0) {
			type t = service.getById(parentid);
			m.put("name",t.getName());
			String path = "/<a href=\"type_list?parentid="+t.getId()+"\">"+t.getName()+"</a >";
			while(t.getParentid()>0) {
				t = service.getById(t.getParentid());
				path="/<a href=\"type_list?parentid="+t.getId()+"\">"+t.getName()+"</a >"+path;
			}
			path="<a href=\"type_list?parentid=0\">根节点</a >"+path;
			m.put("path", path);
			m.put("myparentid", t.getParentid());
		}else {
			m.put("name","根节点");
			m.put("path", "<a href=\"type_list?parentid=0\">根节点</a >");
			m.put("myparentid", 0);
		}
		info.setCanPage(false);
		info.setWhere("where type.parentid="+parentid);
		m.put("list", service.select(info));
		
	}
	
	
	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(type o) {
		System.out.println(o.getName()+o.getParentid());
		service.insert(o);
		return new jsonInfo(5, "");
	}
	@RequestMapping("delete")
	public String insert(int id) {
		service.delete(id);
		return "redirect:type_list";
	}
	
	@RequestMapping("update")
	public @ResponseBody jsonInfo update(type o) {
		service.update(o);
		return new jsonInfo(5, "");
	}
	
	
	@RequestMapping("add")
	public String add(int parentid,ModelMap m) {
		m.put("parentid", parentid);
			return "type/type-add";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {
		m.put("info", service.getById(id));
		return "type/type-add";
	}
}
