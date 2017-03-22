package com.fh.controller.app.trainingpage;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.PageBean;
import com.fh.service.trainingmanage.insiderecommended.InsiderecommendedManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.util.PageData;
import com.mysql.fabric.xmlrpc.base.Array;

/** 
 * 说明：站内推荐
 * 创建人：shunc
 * 创建时间：2016-09-02
 */
@Controller
@RequestMapping(value="/train_insiderecommended")
public class TrainInsidereCommendController extends BaseController {

	@Resource(name="insiderecommendedService")
	private InsiderecommendedManager insiderecommendedService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	@ResponseBody
	public void list(Page page,HttpServletResponse response) throws Exception{

		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<PageData>	varList = insiderecommendedService.list(page);	//列出insiderecommended列表
		
		List<String> imgList = new ArrayList();	//列出special列表
		List<String> titleList = new ArrayList();	//列出special列表
		for(int i=0;i<varList.size();i++){
			pd = this.getPageData();
			pd.put("SPECIAL_ID",varList.get(i).getString("SPECIAL_ID"));
			
			pd = specialService.findById(pd);
			titleList.add(pd.getString("TITLE"));
			imgList.add(pd.getString("IMG_PATH"));
		}
		
		JSONObject json =new JSONObject();
		json.put("varList", varList);
		json.put("imgList", imgList);
		json.put("titleList", titleList);
		//out.write("success");
		
		//设置格式为text/json    
	     response.setContentType("text/json"); 
	    //设置字符集为'UTF-8'
	    response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
		
	}
}
