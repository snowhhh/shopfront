package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.operator_dao;
import entity.operator;
import service.operator_service;
import utils.jsonInfo;

@Controller
public class login_controller {
	@Autowired
	operator_service service;
	@Resource
	  HttpServletRequest request;
	@RequestMapping("login")
	public @ResponseBody jsonInfo login(ModelMap m, operator o,String code) {
	List<operator> list=service.getByname(o);
	if(request.getSession().getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
	if(list.size()>0) {
		m.addAttribute("user",o);
		request.getSession().setAttribute("user",list.get(0));
	
		return new jsonInfo(1,"成功");
	}}
		return new jsonInfo(0, "失败");
	}
	
	@RequestMapping("newpass")
	public String newpass(int id,ModelMap m) {
		operator o=service.getById(id);
		m.put("olist", o);
		return "editpass";			
	} 
	@RequestMapping("editpass")
	public @ResponseBody jsonInfo editpass(operator o) {
		service.getByname(o);
	//service.pupdate(o);
		return new jsonInfo(1,"成功");
	}
}
