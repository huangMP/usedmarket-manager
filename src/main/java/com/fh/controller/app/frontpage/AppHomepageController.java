package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fh.controller.base.BaseController;
import com.fh.entity.PageBean;
import com.fh.service.pagemanage.documenttrends.DocumentTrendsManager;
import com.fh.service.pagemanage.exhibition.ExhibitionManager;
import com.fh.service.pagemanage.link.LinkManager;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.util.Const;
import com.fh.util.PageData;

/**
 * 首页控制器
 * @author WangZK
 *
 */
@Controller
@RequestMapping(value="/app_homepage")
public class AppHomepageController extends BaseController {

	@Resource(name="documenttrendsService")
	private DocumentTrendsManager documenttrendsService;
//	@Resource(name="singleImgService")
//	private SingleImgManager singleImgService;
//	@Resource(name="exhibitionService")
//	private ExhibitionManager exhibitionService;
//	@Resource(name="linkService")
//	private LinkManager linkService;
	/**
	 * 
	 * currentPage=1&showCount=15
	 * */
	@RequestMapping(value="/list")
	public void list(HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PrintWriter out = response.getWriter();
		
		List<Integer> types = new ArrayList<Integer>();
		types.removeAll(types);
		types.add(7);
		List<PageData> dynamicsList = findDocList(types);//工作动态列表
		types.removeAll(types);
		types.add(8);
		List<PageData> noticesList = findDocList(types);//通知公告列表
		types.removeAll(types);
		types.add(13);
		List<PageData> casesList = findDocList(types);
		types.removeAll(types);
		types.add(4);
		types.add(5);
		List<PageData> lowAndStandList = findDocList(types);
		types.removeAll(types);
		types.add(9);
		List<PageData> otherInfList = findDocList(types);
//		List<PageData> exhibitionList = findExhList();
//		List<PageData> linkList = linkService.listAll(null);
		types.removeAll(types);
		types.add(14);
		List<PageData> introList = findDocList(types);//馆局介绍列表
		
		/* * 正文内容长度超过160的只显示160个字符
		*/ 
		Pattern p_html = Pattern.compile(Const.REGEX_HTML, Pattern.CASE_INSENSITIVE);  
			String htmlStr = introList.get(0).getString("TEXT");
			Matcher m_html = p_html.matcher(htmlStr);  
			htmlStr = m_html.replaceAll(""); // 过滤html标签 
			if(htmlStr.length()>15)
			{
				String text = htmlStr.substring(0, 160)+"......";
				//System.out.println(text);
				introList.get(0).put("TEXT", text);
			}

		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("dynamicsList", dynamicsList);
		map.put("noticesList", noticesList);
		map.put("casesList", casesList);
		map.put("lowAndStandList", lowAndStandList);
		map.put("otherInfList", otherInfList);
//		map.put("exhibitionList", exhibitionList);
//		map.put("linkList", linkList);
		map.put("introList", introList);
		
		JSONArray jsonArray = JSONArray.fromObject(map);
		String dataString = jsonArray.toString();
		
		out.write(dataString);
        out.close();

	}

	/**
	 * 获取文档列表
	 * */
	private List<PageData> findDocList(List<Integer> types
			) throws Exception {
		PageBean page = new PageBean();
		page.setCurrentPage(1);
		page.setShowCount(6);
		PageData pd = new PageData();
		pd.put("types", types);
		page.setPd(pd);	
		List<PageData>	varList = documenttrendsService.list(page);	//列表
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADD_TIME")));
		}
		return varList;
	}
	/**
	 * 获取网上展厅列表
	 * *//*
	private List<PageData> findExhList(
			) throws Exception {
		PageBean page = new PageBean();
		page.setCurrentPage(1);
		page.setShowCount(6);
		PageData pd = new PageData();
		page.setPd(pd);	
		List<PageData>	varList = exhibitionService.list(page);	//列表
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADD_TIME")));
		}
		return varList;
	}*/
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
