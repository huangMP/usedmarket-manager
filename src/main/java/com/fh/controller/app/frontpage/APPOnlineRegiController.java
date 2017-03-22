package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.pagemanage.connection.impl.ConnectionService;
import com.fh.service.pagemanage.message.impl.MessageService;
import com.fh.service.pagemanage.signup.impl.SignUpService;
import com.fh.util.PageData;

/** 
 * 说明：在线报名
 * 创建人：liangzhilin
 * 创建时间：2016-08-19
 */
@Controller
@RequestMapping(value="/app_signup")
public class APPOnlineRegiController extends BaseController {
	
	@Resource(name="signupService")
	private SignUpService signUpService;
	
	
	
	/**
	 *保存报名信息
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/setmessage")
	public void setMessage(String NOTE,String NAME,String ADDRESS,String COURSE_ID,String UNIT,String PHONE,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SIGNUP_ID", this.get32UUID());	//主键
		pd.put("ISHANDLED", "0");	//是否已处理
		pd.put("HANDLE_PERSON", "--");	//处理人
		pd.put("NAME", NAME);
		pd.put("COURSE_ID", COURSE_ID);
		pd.put("ADDRESS", ADDRESS);
		pd.put("NOTE", NOTE);
		pd.put("PHONE", PHONE);
		pd.put("UNIT", UNIT);
		pd.put("ADD_TIME", new Date());
		signUpService.save(pd);
		out.write("success");
        out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
