package cn.edu.nyist.springboot09_jsp_hbi.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.springboot09_jsp_hbi.biz.AdminBiz;
import cn.edu.nyist.springboot09_jsp_hbi.model.Admin;
import cn.edu.nyist.springboot09_jsp_hbi.reposity.AdminRepository;

@Service
public class AdminBIzImpl implements AdminBiz {
	@Autowired
	private AdminRepository adminRepository;

	@Override
	public Admin findAdminByid(String name, String pwd) {
	
		//return adminRepository.findByNameAndPwd(name, pwd);
		return adminRepository.findByNameAndPwd(name, pwd);
	}



}
