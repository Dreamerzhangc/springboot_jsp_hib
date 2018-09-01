package cn.edu.nyist.springboot09_jsp_hbi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminInterceptor implements HandlerInterceptor {
	// controller方法执行之前拦截，返回false流程停止
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		/*
		 * interceptor只拦截controller 1. 首先判断是否登录 2.然后判断是否是tologin，login的url，放行
		 */
		String requestURL = request.getRequestURI();// 获取请求的url
		
		if (request.getSession().getAttribute("success") == null) {
			if (requestURL.endsWith("/tologin") || requestURL.endsWith("/login") ||requestURL.endsWith("vcode.png")) {
			
				// 如果是到登录界面放行
				return true;
			}else {
			
				response.sendRedirect("/tologin");// 跳转到登录界面	
			}
			
			return false;
		} else {
		
			return true;
		}

	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}
	

}
