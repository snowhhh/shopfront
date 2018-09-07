package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.orders;
import utils.SearchInfo;

@Repository
public interface orders_dao {
	@Select("select orders.*,u.email uname,a.zone azone from orders inner join user u on orders.user_id=u.id inner join address a on orders.address_id=a.id ${where}")
	
	public List<orders> select(SearchInfo info);

	@Insert("insert into orders(date,code,amount,nowamount,address_id,user_id,status,assessstatus,comments) value(#{date},#{code},#{amount},#{nowamount},#{address_id},#{user_id},#{status},#{assessstatus},#{comments})")
	public void insert(orders o);

	@Select("select * from orders where id=#{id}")
	public orders getById(int id);


}
