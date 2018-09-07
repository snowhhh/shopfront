package service;

import java.util.Date;
import java.util.List;

import entity.orders;
import utils.SearchInfo;

public interface orders_service {
	public List<orders> select(SearchInfo info);
	public void insert(orders o);
	public orders getById(int id);
	public void update(orders o);	
}
