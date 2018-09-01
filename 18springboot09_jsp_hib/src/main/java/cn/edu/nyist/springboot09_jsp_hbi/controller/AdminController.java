package cn.edu.nyist.springboot09_jsp_hbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.springboot09_jsp_hbi.Utils.Md5Utils;
import cn.edu.nyist.springboot09_jsp_hbi.biz.AdminBiz;
import cn.edu.nyist.springboot09_jsp_hbi.model.Admin;

@Controller
public class AdminController {
	@Autowired
	private AdminBiz adminBiz;

	@RequestMapping(path = "/tologin")
	public String tologin() {
		return "login";
	}

	@RequestMapping(path = "/login")
	public String login(@RequestParam String name, @RequestParam String pwd, @RequestParam String vcode,Model model, HttpSession session) {
		String servervcode=(String) session.getAttribute("validateCode");//接收服务器验证码
	//	System.out.println(servervcode);
		if(!servervcode.equalsIgnoreCase(vcode))//验证码比较不区分大小写
		{
			model.addAttribute("msg", "验证码错误");
			return "login";
		}
		//MD5加密算法，防止明文密码泄露，登录对比加密密码
		Admin admin = adminBiz.findAdminByid(name, Md5Utils.getMD5(pwd));
		if (admin == null) {
			// 错误信息提示
			model.addAttribute("msg", "用户名或者密码错误");
			return "login";

		} else {
			// System.out.println(admin);
			session.setAttribute("success", admin);// 登陆成功，保存登录用户在session范围
			return "redirect:/tomain";//到登录界面

		}

	}

	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.invalidate();// 清除用户记录
		return "redirect:/tologin";// 跳转到登录界面
	}
}
