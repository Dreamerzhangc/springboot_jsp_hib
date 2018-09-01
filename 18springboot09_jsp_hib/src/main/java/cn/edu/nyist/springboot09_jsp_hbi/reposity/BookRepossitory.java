package cn.edu.nyist.springboot09_jsp_hbi.reposity;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.edu.nyist.springboot09_jsp_hbi.model.Book;

public interface BookRepossitory extends PagingAndSortingRepository<Book, Integer> ,JpaSpecificationExecutor<Book>{
    //父接口已经定义方法
//   	int save(Book book);
  
	//@Select("select  *  from  t_book where id=#{id}")
	//Book findBookByid(int id);

	//@Select("select  *  from  t_type where id=#{tid}")
	//Type findTypeByid(int tid);

	//@SelectProvider(type = BookProver.class, method = "FindAllProveter")
	//List<Book> findAllb(@Param(value = "name") String name, @Param(value = "tid") int tid);

	//@Delete("delete from t_book where id=#{id}")
	//int delByid(int id);
    
	
	//更新是动态sql，根据条件更新，所以使用注解@DynamicUpdates
	//@UpdateProvider(type = BookProver.class, method = "updatebook")
	//int update(Book book);

}
