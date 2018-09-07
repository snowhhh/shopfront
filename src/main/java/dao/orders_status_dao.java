package dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.orders_status;
import utils.SearchInfo;
@Repository
public interface orders_status_dao {
		@Select("select * from orders_status")
		public List<orders_status> select(SearchInfo info);

		@Insert("insert into orders_status(orders_id,date,dest_status,info,num,amount,comments) value(#{orders_id},#{date},#{dest_status},#{info},#{num},#{amount},#{comments})")
		public void insert(orders_status o);

		@Select("select * from orders_status where id=#{id}")
		public orders_status getById(int id);
		
		@Update("update orders_status set dest_status=#{dest_status} where id=#{id}")
		public void update(orders_status o);

	}
