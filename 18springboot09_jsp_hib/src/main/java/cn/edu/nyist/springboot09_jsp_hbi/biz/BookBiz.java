package cn.edu.nyist.springboot09_jsp_hbi.biz;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;



import cn.edu.nyist.springboot09_jsp_hbi.model.Book;
import cn.edu.nyist.springboot09_jsp_hbi.model.Type;

public interface BookBiz {
	@Transactional
	Book saveBook(Book book);

	@Transactional(readOnly = true)
	List<Type> findAll();

	@Transactional(readOnly = true)
	Book findByid(int id);

	@Transactional
	Type findByTid(int tid);

	@Transactional(readOnly = true)
	Page<Book> findAllBook(int pageNo, String name, int tid,String sortpro);

	@Transactional
	void delBook(int id);

	@Transactional
	Book updateBook(Book book);

}
