package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.http.HttpResponse;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.pagemanage.link.LinkManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 说明：链接表(前台专用controller)
 * 创建人：liangzhilin
 * 创建时间：2016-08-19
 */
@Controller
@RequestMapping(value="/app_link")
public class AppLinkController extends BaseController {
	
	@Resource(name="linkService")
	private LinkManager linkService;
	
	
	/**
	 * 页面跳转
	 * 
	 */
	@RequestMapping(value="/goPage")
	public ModelAndView goLink(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/link");
		return mv;
	}
	
	/**
	 * 查找全部返回到前台页面（这里数据少，不需分页）
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public void list(HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)&& !"all".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		List<PageData>	varList = linkService.listAll(pd);	//列出Link列表
		JSONArray jsonArray = JSONArray.fromObject(varList);
		String dataString = jsonArray.toString();
		out.write(dataString);
        out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
