package service;

import java.util.List;

import entity.operator;
import utils.SearchInfo;

public interface operator_service {
	public List<operator> select(SearchInfo info);
	public List<operator> getByname(operator o);
	public void insert(operator o);
	public operator getById(int id);
	public void update(operator o);
	public void supdate(operator o);
	public void delete(int id);
	public void deleteall(SearchInfo info);
	public void pupdate(operator o);
}
