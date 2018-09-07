package dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.type;
import utils.SearchInfo;
@Repository
public interface type_dao {
		@Select("select type.*,t.name parent_name from type left join type t on type.parentid=type.id ${where} ")
		public List<type> select(SearchInfo info);
		
		@Select("select * from type")
		public List<type> sselect();

		@Insert("insert into type(name,parentid) value(#{name},#{parentid})")
		public void insert(type o);

		@Select("select * from type where id=#{id}")
		public type getById(int id);

		@Update("update type set name=#{name} where id=#{id}")
		public void update(type o);

		@Delete("delete from type where id=#{id}")
		public void delete(int id);
	}
