package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.operator_dao;
import dao.product_dao;
import entity.operator;
import entity.product;
import service.product_service;
import utils.SearchInfo;

@Service
public class product_serviceImpl implements product_service {
	@Autowired
	product_dao dao;

	public List<product> select(SearchInfo info) {
		
		return dao.select(info);
	}

	public void insert(product p) {
		dao.insert(p);

	}

	public product getById(int id) {
		
		return dao.getById(id);
	}

	public void update(product p) {
		dao.update(p);

	}

	public void supdate(product p) {
		dao.supdate(p);

	}

	public void delete(int id) {
		dao.delete(id);
	}

	public void deleteall(SearchInfo info) {
		dao.deleteall(info);

	}

}
