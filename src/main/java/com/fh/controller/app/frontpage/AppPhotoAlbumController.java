package com.fh.controller.app.frontpage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.PageBean;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.util.SortUtil;
import com.fh.util.Tools;
import com.fh.util.Watermark;
import com.fh.service.information.pictures.PicturesManager;
import com.fh.service.pagemanage.photoalbum.PhotoAlbumManager;


/**
 * <p>Title: 图集管理 </p>
 * <p>Description:  </p>
 * @author  huangMP
 * @date    2016年8月22日
 */
@Controller
@RequestMapping(value="/app_photoalbum")
public class AppPhotoAlbumController extends BaseController {
	
	/**
	 * 注入图集管理Service
	 */
	@Resource(name="photoalbumService")
	private PhotoAlbumManager photoalbumService;

	/**
	 * 页面跳转到图集管理页面
	 * @return
	 */
	@RequestMapping(value="/goPage")
	public ModelAndView goPage(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/photoalbum");
		return mv;
	}
	
	/**
	 * 页面跳转到图集详情页面
	 * @return 
	 */
	@RequestMapping(value="/goDetailPage")
	public ModelAndView goDetailPage(String PHOTOALBUM_ID){
		ModelAndView mv = this.getModelAndView();
		mv.addObject("PHOTOALBUM_ID", PHOTOALBUM_ID);
		mv.setViewName("frontpage/img_text");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public void list(PageBean page , HttpSession session ,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");//改编码格式
		
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords) && !"all".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}else{
			pd.put("keywords", null);
		}
		
		page.setPd(pd);
		List<PageData>	varList = photoalbumService.list(page);	//列出PhotoAlbum列表	
		
		for(int i = 0;i<varList.size();i++){	//修改每一项的日期格式
			varList.get(i).put("ADD_TIME",  new SimpleDateFormat("yyyy/MM/dd").format( varList.get(i).get("ADD_TIME") ).toString() );
		}
		
		page.setPds(varList);
		
		JSONArray jsonArray = JSONArray.fromObject(page);
		String dataString = jsonArray.toString();
		response.getWriter().write(dataString);
		return ;
	}
	
	/**根据id获取某个图集的详细信息
	 * @param HttpServletResponse response
	 * @throws Exception
	 */
	@RequestMapping(value="/getDetail")
	public void getDetail(HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");//改编码格式
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = photoalbumService.findById(pd);	//根据ID读取
		
		String itemPicturesPath = pd.getString("IMAGE_ID_COLLECTION");
		String[] itemPicturesPathList = itemPicturesPath.split(",");
		pd.put("IMAGE_ID_COLLECTION",itemPicturesPathList);
		
		JSONArray jsonArray = JSONArray.fromObject(pd);
		String dataString = jsonArray.toString();
		response.getWriter().write(dataString);
		return ;
	}
	
}
