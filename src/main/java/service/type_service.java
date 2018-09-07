package service;

import java.util.List;

import entity.type;
import utils.SearchInfo;

public interface type_service {
	public List<type> select(SearchInfo info);
	public List<type> sselect();
	public void insert(type o);
	public type getById(int id);
	public void update(type o);
	public void delete(int id);
}
