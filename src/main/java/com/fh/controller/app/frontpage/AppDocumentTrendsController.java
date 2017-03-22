package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.PageBean;
import com.fh.service.pagemanage.documenttrends.DocumentTrendsManager;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/app_documentTrends")
public class AppDocumentTrendsController extends BaseController {
	
	@Resource(name="documenttrendsService")
	private DocumentTrendsManager documenttrendsService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	
	@RequestMapping(value="/goTrends")
	public ModelAndView goTrends(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/documentTrends");
		return mv;
	}
	
	@RequestMapping(value="/goSpecial")
	public ModelAndView goSpecial(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/documentTrendsSpecial");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public  @ResponseBody PageBean list(PageBean page,String type) throws Exception{
		
		
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<Integer> types = new ArrayList<Integer>();
		if(type != null){
			types.add(Integer.parseInt(type));
			pd.put("types", types);
			
		}else{
			types.add(7);
			pd.put("types", types);
		}
		
		page.setPd(pd);	
		List<PageData>	varList = documenttrendsService.list(page);	//列出DocumentTrends列表
		
		/*
		 * 处理时间
		 */
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		
		page.setPds(varList);
		return page;

	}
	
	/**特殊展示列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSpecial")
	public void listSpecial(Page page,HttpServletResponse response) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		List<PageData>	varList = documenttrendsService.listSpecial(pd);	//列出DocumentTrends列表
		
		/*
		 * 处理时间
		 */
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADD_TIME")));
		}
		
		JSONObject json =new JSONObject();
		json.put("varList", varList);
		
		//out.write("success");
		
		//设置格式为text/json    
	     response.setContentType("text/json"); 
	    //设置字符集为'UTF-8'
	    response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
		
		
	}
	
	/**
	 * 获取单条数据
	 * @throws Exception
	 */
	@RequestMapping(value="getDoc")
	public ModelAndView getDoc(
			@RequestParam(value="DOCUMENT_ID",required=false) String DOCUMENT_ID,
			@RequestParam(value="BROWSING_TIMES",required=false) int BROWSING_TIMES
			) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("DOCUMENT_ID", DOCUMENT_ID);
		//pd = documenttrendsService.findById(pd);//拿到原文档对象
		//int num = Integer.parseInt(pd.getString("BROWSING_TIMES"))+1;
		System.out.println(BROWSING_TIMES);
		pd.put("BROWSING_TIMES", BROWSING_TIMES+1);
		documenttrendsService.edit(pd);
		
		pd.put("DOCUMENT_ID", DOCUMENT_ID);
		pd = documenttrendsService.findById(pd);//拿到原文档对象
		/*pd.put("ADD_TIME",
				new SimpleDateFormat("yyyy/MM/dd").format(pd.getString("ADD_TIME")));*/

		mv.addObject("pd",pd);
		
		mv.setViewName("frontpage/demo/documentTrendsDoc");
		return mv;

	}
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

}
