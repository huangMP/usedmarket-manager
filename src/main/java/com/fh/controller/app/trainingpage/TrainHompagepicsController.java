package com.fh.controller.app.trainingpage;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.PageBean;
import com.fh.service.information.pictures.PicturesManager;
import com.fh.service.trainingmanage.homepagepics.HomepagepicsManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 说明：首页轮播图
 * 创建人：shunc
 * 创建时间：2016-09-02
 */
@Controller
@RequestMapping(value="/train_homepagepics")
public class TrainHompagepicsController extends BaseController{

	
	@Resource(name="homepagepicsService")
	private HomepagepicsManager homepagepicsService;
	@Resource(name="picturesService")
	private PicturesManager picturesService;
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public @ResponseBody PageBean list(PageBean page) throws Exception{

		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<PageData>	varList = homepagepicsService.list(page);	//列出Homepagepics列表
		
		page.setPds(varList);
		return page;
	}
}
