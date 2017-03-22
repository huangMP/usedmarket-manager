package com.fh.controller.trainingmanage.login;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.User;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.Tools;

/*
 * 人员登录
 * shunc
 * */
@Controller
public class TrainLoginController extends BaseController{
	
	@Resource(name="traininguserService")
	private TraininguserManager traininguserService;
	
	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/train_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		mv.setViewName("trainingpage/signin");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**访问人员主页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/train_main")
	public ModelAndView toMain()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		mv.setViewName("trainingpage/train_main");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/training_login")
	@ResponseBody
	public String login()throws Exception{
		
		Map<String,String> map = new HashMap<String,String>();
		
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String result = "";
		
		String KEYDATA[] = pd.getString("KEYDATA").split(",");
		
		Session session = Jurisdiction.getSession();
		pd.put("USERNAME", KEYDATA[0]);
		pd.put("PASSWORD", MD5.md5(KEYDATA[1]));
		
		System.out.println(pd.getString("USERNAME"));
		System.out.println(pd.getString("PASSWORD"));
		
		pd = traininguserService.getUserByNameAndPwd(pd);

		try {
			if(pd.getString("NAME")!= null&&!pd.getString("NAME").equals("")){
				User user = new User();
				
				user.setNAME(pd.getString("NAME"));//姓名
				user.setUSER_ID(pd.getString("USER_ID"));//用户id
				user.setUSERNAME(pd.getString("USERNAME"));//用户名
				user.setSKIN(pd.getString("BZ"));//班级
				
				session.setAttribute("TRAIN_USER", user);
				session.setAttribute("TRAIN_USER_NAME", user.getNAME());
				
				pd.put("USER_ID", pd.getString("USER_ID"));
				pd.put("LAST_LOGIN",DateUtil.getTime().toString());
				traininguserService.updateLastLogin(pd);
				
				result = "success";
			}else{
				result = "error";
			}
		} catch (Exception e) {
			result = "error";
			e.printStackTrace();
		}
		
		System.out.println(session.getAttribute("TRAIN_USER"));
		
		return result;
	}
	
	/**
	 * 用户修改密码
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/train_revise")
	@ResponseBody
	public String revise() throws Exception{
		
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "";
		
		Session session = Jurisdiction.getSession();
		
		User user = (User) session.getAttribute("TRAIN_USER");
		
		System.out.println(user.getUSER_ID());
		System.out.println(pd.getString("oldPaw"));
		System.out.println(pd.getString("newPaw"));
		
		String newPaw = pd.getString("newPaw");
		
		pd.put("USERNAME", user.getUSERNAME());
		pd.put("PASSWORD", MD5.md5(pd.getString("oldPaw")));
		pd = traininguserService.getUserByNameAndPwd(pd);

		try {
			if(pd!=null){
				
				pd.put("PASSWORD", MD5.md5(newPaw));
				pd.put("USER_ID", user.getUSER_ID());
				
				traininguserService.updatePassword(pd);
				
				result = "success";
			}else{
				result = "error";
				return result;
			}
		} catch (NullPointerException e) {
			result = "error";
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/train_logout")
	public ModelAndView logout(){
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		Session session = Jurisdiction.getSession();	//以下清除session缓存
		session.removeAttribute("TRAIN_USER");
		session.removeAttribute("TRAIN_USER_NAME");
		
		mv.setViewName("trainingpage/signin");
		mv.addObject("pd",pd);
		return mv;
	}
	
	
}
