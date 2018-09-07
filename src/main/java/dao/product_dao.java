package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.operator;
import entity.product;
import utils.SearchInfo;

@Repository
public interface product_dao {
	@Select("select product.*,t.name tname from product inner join type t on product.type_id=t.id ${where} ${limit}")

	public List<product> select(SearchInfo info);

	@Insert("insert into product(fullname,type_id,activity,tip,sale,info,price,nowprice,salecount,collectcount,priority,status,pics,comments) value(#{fullname},#{type_id},#{activity},#{tip},#{sale},#{info},#{price},#{nowprice},0,0,#{priority},#{status},#{pics},#{comments})")
	public void insert(product p);

	@Select("select * from product where id=#{id}")
	public product getById(int id);

	@Update("update product set fullname=#{fullname},type_id=#{type_id},activity=#{activity},tip=#{tip},sale=#{sale},info=#{info},price=#{price},nowprice=#{nowprice},priority=#{priority},status=#{status},pics=#{pics},comments=#{comments} where id=#{id}")
	public void update(product p);
	
	@Update("update product set status=#{status} where id=#{id}")
	public void supdate(product p);

	@Delete("delete from product where id=#{id}")
	public void delete(int id);
	
	@Delete("delete from product  where id in (${ids})")
	public void deleteall(SearchInfo info);
}
