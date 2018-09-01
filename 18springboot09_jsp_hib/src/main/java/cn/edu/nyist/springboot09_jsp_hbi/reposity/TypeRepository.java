package cn.edu.nyist.springboot09_jsp_hbi.reposity;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import cn.edu.nyist.springboot09_jsp_hbi.model.Type;

public interface TypeRepository extends CrudRepository<Type, Integer>{
	 //父接口已经定义方法，不用定义此次
		
	    List<Type> findAll();
}
