package dao;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.orders_details;
import utils.SearchInfo;
@Repository
public interface orders_details_dao {
		@Select("select * from orders_details ${where} ${limit}")
		public List<orders_details> select(SearchInfo info);

		@Insert("insert into orders_details(orders_id,product_id,count,price,nowprice,comments) value(#{orders_id},#{product_id},#{count},#{price},#{nowprice},#{comments})")
		public void insert(orders_details o);
		
		@Select("select orders_details.*,o.code ocode,p.fullname pname,a.email aname from orders_details inner join orders o on orders_details.orders_id=o.id inner join product p on orders_details.product_id=p.id inner join user a on orders_details.user_id=a.id where orders_id=#{id}")
		public List<orders_details> getById(int id);	
	}
