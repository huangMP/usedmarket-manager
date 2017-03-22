package com.maker.controller.web;

import com.maker.entity.UserInfo;
import com.maker.service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by huangMP on 2016/11/18.
 * decription : 动态信息 controller
 */
@Controller
@RequestMapping("/WebLogin")
public class WebLoginController {

    @Autowired
    UserInfoService userInfoService;

    /**
     * 跳转到用户登录页面
     * @return Dynamics
     */
    @RequestMapping(value = "/toLogin")
    @ResponseBody
    public ModelAndView toLogin(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("system/login");
        return modelAndView;
    }

    /**
     * 跳转到权限不足页面
     * @return Dynamics
     */
    @RequestMapping(value = "/toUnauthorizedPage")
    @ResponseBody
    public ModelAndView toUnauthorizedPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("system/unauthorized");
        return modelAndView;
    }

    /**
     * 跳转到主页
     * @return Dynamics
     */
    @RequestMapping(value = "/toHomePage")
    @ResponseBody
    public ModelAndView toHomePage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:system/homepage");
        return modelAndView;
    }

    /**
     * 执行登录操作
     * @return Dynamics
     */
    @RequestMapping(value = "/doLogin")
    @ResponseBody
    public ModelAndView doLogin(UserInfo userInfo){
        ModelAndView modelAndView = new ModelAndView();
        String userName=userInfo.getUsername();
        String password=userInfo.getPassword();
        Subject subject=SecurityUtils.getSubject();
        UsernamePasswordToken currentUser=new UsernamePasswordToken(userName, password);
        try{
            subject.login(currentUser);
            System.out.println("验证通过");
            modelAndView.setViewName("system/homepage");
            return modelAndView;
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("验证不通过");
            modelAndView.setViewName("system/login");
            modelAndView.addObject("errorMassage","用户名或密码输入错误");
            return modelAndView;
        }
    }

    /**
     * 执行退出登录操作
     * @return Dynamics
     */
    @RequestMapping(value = "/doLogout")
    @ResponseBody
    public ModelAndView doLogout( ){
        ModelAndView modelAndView = new ModelAndView();
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.isAuthenticated()) {
            currentUser.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
            modelAndView.addObject("errorMassage","用户正常退出");
        }else{
            modelAndView.addObject("errorMassage","您还没登录呢");
        }
        modelAndView.setViewName("system/login");
        return modelAndView;
    }

}
