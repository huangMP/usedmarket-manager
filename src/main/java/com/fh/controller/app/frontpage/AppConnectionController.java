package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.pagemanage.connection.impl.ConnectionService;
import com.fh.service.pagemanage.message.impl.MessageService;
import com.fh.util.PageData;

/** 
 * 说明：链接表(前台专用controller)
 * 创建人：liangzhilin
 * 创建时间：2016-08-19
 */
@Controller
@RequestMapping(value="/app_connection")
public class AppConnectionController extends BaseController {
	
	@Resource(name="connectionService")
	private ConnectionService connectionService;
	@Resource(name="messageService")
	private MessageService messageService;
	
	
	
	/**
	 * 查找全部返回到前台页面（这里数据少，不需分页）
	 * @throws Exception
	 */
	@RequestMapping(value="/find")
	public void find(HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)&& !"all".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd = connectionService.listAll(pd).get(0);	//列出Link列表
		JSONArray jsonArray = JSONArray.fromObject(pd);
		String dataString = jsonArray.toString();
		out.write(dataString);
        out.close();
	}
	/**
	 * 留言
	 * @throws Exception
	 */
	@RequestMapping(value="/setmessage")
	public void setMessage(String MESSAGECONTENT,String NAME,String EMAIL,String PHONE)throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MESSAGE_ID", this.get32UUID());	//主键
		pd.put("ISHANDLED", "0");	//是否已处理
		pd.put("HANDLE_PERSON", "--");	//处理人
		pd.put("NAME", NAME);
		pd.put("EMAIL", EMAIL);
		pd.put("PHONE", PHONE);
		pd.put("MESSAGETIME", new Date());
		messageService.save(pd);
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
