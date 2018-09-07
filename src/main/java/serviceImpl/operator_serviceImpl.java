package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.operator_dao;
import entity.operator;
import service.operator_service;
import utils.SearchInfo;

@Service
public class operator_serviceImpl implements operator_service {
	@Autowired
	operator_dao dao;

	public List<operator> select(SearchInfo info) {

		return dao.select(info);
	}

	public void insert(operator o) {
	dao.insert(o);

	}

	public operator getById(int id) {
		
		return dao.getById(id);
	}

	public void update(operator o) {
		dao.update(o);

	}

	public void delete(int id) {
		dao.delete(id);

	}

	public void deleteall(SearchInfo info) {
		dao.deleteall(info);
		
	}

	public void supdate(operator o) {
		dao.supdate(o);
		
	}

	public List<operator> getByname(operator o) {
		// TODO Auto-generated method stub
		return dao.getByname(o);
	}

	public void pupdate(operator o) {
		// TODO Auto-generated method stub
		dao.pupdate(o);
	}

}
