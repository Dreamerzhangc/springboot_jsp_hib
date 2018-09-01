package cn.edu.nyist.springboot09_jsp_hbi.biz;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.springboot09_jsp_hbi.model.Admin;

public interface AdminBiz {
	//业务层开事务
    @Transactional(readOnly=true)
	public Admin findAdminByid(String name, String pwd);
}
