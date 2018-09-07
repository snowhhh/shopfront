package serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.orders_dao;
import entity.orders;
import service.orders_service;
import utils.SearchInfo;
@Service
public class orders_serviceImpl implements orders_service{
	@Autowired
	orders_dao dao;
	public List<orders> select(SearchInfo info) {
		// TODO Auto-generated method stub
		return dao.select(info);
	}

	public void insert(orders o) {
		dao.insert(o);
		
	}

	public orders getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	public void update(orders o) {
		// TODO Auto-generated method stub
		
	}

}
