package cn.edu.nyist.springboot09_jsp_hbi.biz.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;

import cn.edu.nyist.springboot09_jsp_hbi.PageConstant;
import cn.edu.nyist.springboot09_jsp_hbi.biz.BookBiz;
import cn.edu.nyist.springboot09_jsp_hbi.model.Book;
import cn.edu.nyist.springboot09_jsp_hbi.model.Type;
import cn.edu.nyist.springboot09_jsp_hbi.reposity.BookRepossitory;
import cn.edu.nyist.springboot09_jsp_hbi.reposity.TypeRepository;

@Service
public class BookBizImpl implements BookBiz {
	@Autowired
	private BookRepossitory bookRepository;
	@Autowired
	private TypeRepository typeRepository;

	@Override
	public Book saveBook(Book book) {

		return bookRepository.save(book);
	}

	@Override
	public List<Type> findAll() {

		return typeRepository.findAll();
	}

	@Override
	public Book findByid(int id) {

		return bookRepository.findOne(id);
	}

	@Override
	public Type findByTid(int tid) {

		return typeRepository.findOne(tid);
	}

	@Override
	public Page<Book> findAllBook(int pageNo, final String name, final int tid,String sortpro) {
		//页码，pageNum是从0开始
		List<Order> ls=new ArrayList<Order>();
		if(!StringUtils.isEmpty(sortpro))
		{
			ls.add(new Order(sortpro));//根据name属性排序，默认升序
		}
		else {
			ls.add(new Order(Direction.DESC,"id"));//如果没有指定name属性。默认就是根据id降序排序
		}
		Pageable pageable=new PageRequest(pageNo-1, PageConstant.PAGE_SZIE,new Sort(ls));
		//模糊查询语句
		Specification<Book> spec=new Specification<Book>() {

			@Override
			public Predicate toPredicate(Root<Book> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
			//条件1可能是一个或者二个，或者没有，使用list记录
				List<Predicate>ls=new ArrayList<Predicate>();
			if(tid!=-1) {
				Predicate p1=cb.equal(root.get("tid"), tid);
				ls.add(p1);
			}
			if(name!=null && !name.equals(""))
			{
				Predicate p2=cb.like(root.get("name").as(String.class), "%"+name+"%");
				ls.add(p2);
			}
			//返回的是数组，需要list转换成为数组
			Predicate []arry=new Predicate[ls.size()];
				return cb.and(ls.toArray(arry));
			}
		};
	   Page<Book>pageInfo=bookRepository.findAll(spec, pageable);
		return pageInfo;
	}

	@Override
	public void delBook(int id) {

		bookRepository.delete(id);
	}

	@Override
	public Book updateBook(Book book) {

		return bookRepository.save(book);
	}

}
