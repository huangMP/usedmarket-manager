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
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.trainingmanage.lowandstandard.LowandstandardManager;
import com.fh.util.PageData;

/** 
 * 说明：政策与标准
 * 创建人：shunc
 * 创建时间：2016-09-02
 */
@Controller
@RequestMapping(value="/train_lowandstandard")
public class TrainLowandstandController extends BaseController {

	@Resource(name="lowandstandardService")
	private LowandstandardManager lowandstandardService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	
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
		List<PageData>	varList = lowandstandardService.list(page);	//列出lowandstandard列表
		
		
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
}
