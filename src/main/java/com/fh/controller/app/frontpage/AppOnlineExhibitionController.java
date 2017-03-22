package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.PageBean;
import com.fh.service.pagemanage.document.DocumentManager;
import com.fh.service.pagemanage.exhibition.ExhibitionManager;
import com.fh.service.pagemanage.subject.SubjectManager;
import com.fh.util.PageData;


/**网上展厅
 * @author Peivxuan
 */
@RequestMapping(value="/app_exhibition")
@Controller
public class AppOnlineExhibitionController extends BaseController {
	
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	
	@Resource(name="exhibitionService")
	private ExhibitionManager exhibitionService;
	
	@RequestMapping("goOnlineExhibition")
	public String forword() {
		return "frontpage/demo/exhibition";
	}
	
	
	/**
	 * 获取文档正文
	 */
	@RequestMapping(value="/getExhibitionList")
	@ResponseBody
	public PageBean getDocText(HttpServletResponse response, String type, PageBean page) throws Exception {
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("keywords", type);
		page.setPd(pd);
		List<PageData>	varList = exhibitionService.list(page);	//列出Link列表
		page.setPds(varList);
		return page;
	}
	
	/**
	 * 获取文档列表
	 */
	@RequestMapping(value="/getSubjectsList")
	@ResponseBody
	public void getDocList(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData>	varList = subjectService.listAll(pd);	//列出Link列表
		JSONArray jsonArray = JSONArray.fromObject(varList);
		String dataString = jsonArray.toString();
		out.write(dataString);
        out.close();
	}
	
	/**
	 * 获取列表到首页
	 */
	@RequestMapping(value="/getListToHome")
	@ResponseBody
	public void getListToHome(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PrintWriter out = response.getWriter();
		List<PageData>	varList = findExhList();	//列出Link列表
		JSONArray jsonArray = JSONArray.fromObject(varList);
		String dataString = jsonArray.toString();
		out.write(dataString);
		out.close();
	}
	
	/**
	 * 获取网上展厅列表
	 * */
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
	}

}
