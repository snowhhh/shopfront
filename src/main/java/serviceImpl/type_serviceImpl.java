package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.type_dao;
import entity.type;
import service.type_service;
import utils.SearchInfo;

@Service
public class type_serviceImpl implements type_service {
	@Autowired
	type_dao dao;

	public List<type> select(SearchInfo info) {

		return dao.select(info);
	}

	public void insert(type o) {
		dao.insert(o);

	}

	public type getById(int id) {

		return dao.getById(id);
	}

	public void update(type o) {
		dao.update(o);

	}

	public void delete(int id) {
		dao.delete(id);

	}

	public List<type> sselect() {
		
		return dao.sselect();
	}

}
