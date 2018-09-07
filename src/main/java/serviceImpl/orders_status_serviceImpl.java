package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.orders_status_dao;
import entity.orders_status;
import service.orders_status_service;
import utils.SearchInfo;
@Service
public class orders_status_serviceImpl implements orders_status_service{
	@Autowired
	orders_status_dao dao;
	public List<orders_status> select(SearchInfo info) {
		// TODO Auto-generated method stub
		return dao.select(info);
	}

	public void insert(orders_status o) {
		dao.insert(o);
		
	}

	public orders_status getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	public void update(orders_status o) {
		dao.update(o);
		
	}
	
	
	

}
