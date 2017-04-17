package kr.co.coily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		try {
			if (request.getSession().getAttribute("user") == null) {
				response.sendRedirect("/bit-finalT3/index.html");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

}
