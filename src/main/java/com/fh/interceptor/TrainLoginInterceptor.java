package com.fh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fh.entity.system.User;
import com.fh.util.Const;

/*
 * 人员培训拦截器
 * shunc
 * */
public class TrainLoginInterceptor extends HandlerInterceptorAdapter {

	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取请求的URL  
        String url = request.getServletPath();
        System.out.println(url);
        //URL:train_toLogin 公开访问的，其它的URL都进行拦截控制  
        if(url.indexOf("train_toLogin")>=0){  
        	//System.out.println("gologin-----");
            return true;  
        }  

        User user =  (User)request.getSession().getAttribute("TRAIN_USER");   
        if(user != null){  
            //System.out.println("user------"); 
            return true;  
        }else {
        	
        	response.sendRedirect(request.getContextPath() + "/train_toLogin");
        	return false;  
        }
	}


}
