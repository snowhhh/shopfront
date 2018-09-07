package service;

import java.util.List;

import entity.orders_status;
import utils.SearchInfo;

public interface orders_status_service {
	public List<orders_status> select(SearchInfo info);
	public void insert(orders_status o);
	public orders_status getById(int id);
	public void update(orders_status o);
	
}
