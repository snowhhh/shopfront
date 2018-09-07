package service;

import java.util.List;

import entity.operator;
import entity.product;
import utils.SearchInfo;

public interface product_service {
	public List<product> select(SearchInfo info);
	public void insert(product p);
	public product getById(int id);
	public void update(product p);
	public void supdate(product p);
	public void delete(int id);
	public void deleteall(SearchInfo info);
}
