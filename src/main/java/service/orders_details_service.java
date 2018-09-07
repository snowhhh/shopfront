package service;

import java.util.List;

import entity.orders_details;
import utils.SearchInfo;

public interface orders_details_service {
	public List<orders_details> select(SearchInfo info);
	public void insert(orders_details o);
	public List<orders_details> getById(int id);
}
