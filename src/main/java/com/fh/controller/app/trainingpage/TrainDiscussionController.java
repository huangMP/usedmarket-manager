package com.fh.controller.app.trainingpage;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.PageBean;
import com.fh.entity.system.User;
import com.fh.service.trainingmanage.discussion.DiscussionManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 说明：讨论区
 * 创建人：shunc
 * 创建时间：2016-09-07
 */
@Controller
@RequestMapping(value="/train_discussion")
public class TrainDiscussionController extends BaseController {

	@Resource(name="discussionService")
	private DiscussionManager discussionService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	
	/**
	 * 全部讨论列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/discussion_list")
	public @ResponseBody PageBean List(PageBean page) throws Exception {
		
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("keywords", pd.get("SPECIAL_ID"));
		page.setPd(pd);
		
		List<PageData>	varList = discussionService.list(page);	//列出Discussion列表
		for(int i=0;i < varList.size();i++) {
			varList.get(i).put("MESSAGE_TIME", new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("MESSAGE_TIME")));
		}
		varList.get(0).put("SPECIAL_ID", varList.get(0).get("SPECIAL_ID"));
		page.setPds(varList);
		
		
		return page;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public void save(
			@RequestParam(value="SPECIAL_ID",required=false) String SPECIAL_ID,
			@RequestParam(value="MESSAGE_DETAILS",required=false) String MESSAGE_DETAILS,
			HttpServletResponse response,HttpServletRequest request) throws Exception{

		
		PageData pd = new PageData();
		PageData specialPd = new PageData();
		pd = this.getPageData();
		
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute("TRAIN_USER");// 获取user
		String specialId = pd.getString("SPECIAL_ID");
		
		specialPd = specialService.findById(pd);//找专题
		
		if(!MESSAGE_DETAILS.equals("")&&MESSAGE_DETAILS!=null){
			pd.put("SPECIAL_ID", SPECIAL_ID);
			pd.put("MESSAGE_DETAILS", MESSAGE_DETAILS);
			
			pd.put("PRAISE_NUM",0);
			pd.put("MESSAGE_TIME", new Date());

			pd.put("USER_ID",user.getNAME());
			pd.put("DISCUSSION_ID", this.get32UUID());	//主键
			discussionService.save(pd);
		}
		//获取url
		StringBuffer contextpath = request.getRequestURL();

		int max = contextpath.length();
		int min = max - 21;
		//删除 '/train_discussion/save'
		StringBuffer path = contextpath.replace(min,max, "");
	
		response.sendRedirect(path+"train_special/goDiscussion?SPECIAL_ID="+specialId);
	}
	
	
	/**
	 * 点赞数加一
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/setPraise")
	@ResponseBody
	public int setPraise() throws Exception{
		
		PageData pd = new PageData();
		pd = this.getPageData();

		pd = discussionService.findById(pd);
		int num = (Integer) pd.get("PRAISE_NUM")+1;
		if(pd != null){
			pd.put("PRAISE_NUM", (Integer)pd.get("PRAISE_NUM")+1);
			pd.put("DISCUSSION_ID", pd.get("DISCUSSION_ID"));
			
			discussionService.editNum(pd);
		}

		return num;
	}
	
}
