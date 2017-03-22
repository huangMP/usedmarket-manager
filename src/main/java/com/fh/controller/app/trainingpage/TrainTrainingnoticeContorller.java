package com.fh.controller.app.trainingpage;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.trainingmanage.trainingnotice.TrainingnoticeManager;
import com.fh.util.PageData;

/** 
 * 说明：培训公告表
 * 创建人：shunc
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/train_trainingnotice")
public class TrainTrainingnoticeContorller extends BaseController {

	@Resource(name="trainingnoticeService")
	private TrainingnoticeManager trainingnoticeService;
	
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
		List<PageData>	varList = trainingnoticeService.list(page);	//列出trainingnotice列表
		
		varList.get(0).put("ADD_TIME",
				new SimpleDateFormat("yyyy-MM-dd").format(varList.get(0).get("ADD_TIME")));
		
		JSONObject json =new JSONObject();
		json.put("varList", varList.get(0));
		

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
