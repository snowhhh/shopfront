package dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.operator;
import utils.SearchInfo;
@Repository
public interface operator_dao {
		@Select("select * from operator ${where} ${limit}")
		public List<operator> select(SearchInfo info);
		@Select("select * from operator where nike=#{nike} and password=#{password}")
		public List<operator> getByname(operator o);

		@Insert("insert into operator(nike,name,sex,tel,power,status,comments,password) value(#{nike},#{name},#{sex},#{tel},#{power},0,#{comments},#{password})")
		public void insert(operator o);

		@Select("select * from operator where id=#{id}")
		public operator getById(int id);

		@Update("update operator set nike=#{nike},name=#{name},sex=#{sex},tel=#{tel},power=#{power},comments=#{comments} where id=#{id}")
		public void update(operator o);
		
		@Update("update operator set status=#{status} where id=#{id}")
		public void supdate(operator o);
		
		@Update("update operator set password=#{password} where id=#{id}")
		public void pupdate(operator o);

		@Delete("delete from operator where id=#{id}")
		public void delete(int id);
		
		@Delete("delete from operator where id in ${ids}")
		public void deleteall(SearchInfo info);
	}
