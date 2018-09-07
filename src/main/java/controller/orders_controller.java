package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import entity.orders;
import service.orders_details_service;
import service.orders_service;
import utils.SearchInfo;
import utils.jsonInfo;

@Controller
@RequestMapping("orders")
public class orders_controller {
	@Autowired
	orders_service service;
	@Autowired
	orders_details_service dservice;
	
	@RequestMapping("orders-list")
	public void index(ModelMap m,String start,String end,SearchInfo info) throws ParseException {
		String sdate;
		String edate;
		if(start==null) {
			sdate="0000-01-01";
		}else { 
		sdate = start; }
		if(end==null) {
			edate= "9999-12-30";
		}else { 
		edate = end; }
		
		String where="";
		where=" where date between '"+sdate+"'and '"+edate+"'"; 
		System.out.println(edate);
		System.out.println(sdate);
		info.setWhere(where);
		m.put("search", info);	
		m.put("list",service.select(info));	
	}
	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(orders o) {
		service.insert(o);
		return new jsonInfo(5, "");
	}
	@RequestMapping("update")
	public @ResponseBody jsonInfo update(orders o) {
		service.update(o);
		return new jsonInfo(5, "");
	}

	
	/*@RequestMapping("add")
	public String add(ModelMap m) {
	//	m.put("sexs",  orders.sexs);
//		m.put("powers", orders.powers);
			return "orders/orders-add";
	}*/
	/*@RequestMapping("edit")
	public String edit(int id,ModelMap m) {
		m.put("info", service.getById(id));		
		return add(m);
	}*/
	@RequestMapping("orders-details")
	public void orders_details(int id,ModelMap m) {
		m.put("dlist", dservice.getById(id));	
		
	}
}
