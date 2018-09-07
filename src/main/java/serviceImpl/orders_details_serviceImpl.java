package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.orders_details_dao;
import entity.orders_details;
import service.orders_details_service;
import utils.SearchInfo;
@Service
public class orders_details_serviceImpl implements orders_details_service{
	@Autowired
	orders_details_dao dao;
	public List<orders_details> select(SearchInfo info) {
		// TODO Auto-generated method stub
		return dao.select(info);
	}

	public void insert(orders_details o) {
		dao.insert(o);
		
	}

	public List<orders_details> getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

}
