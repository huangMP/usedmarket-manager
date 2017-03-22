package com.fh.controller.trainingmanage.homepagepics;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.service.information.pictures.PicturesManager;
import com.fh.service.trainingmanage.homepagepics.HomepagepicsManager;

/** 
 * 说明：首页轮播图
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/homepagepics")
public class HomepagepicsController extends BaseController {
	
	String menuUrl = "homepagepics/list.do"; //菜单地址(权限用)
	@Resource(name="homepagepicsService")
	private HomepagepicsManager homepagepicsService;
	@Resource(name="picturesService")
	private PicturesManager picturesService;
	

	
	
	/**打开添加图片插件
	 * @return
	 */
	@RequestMapping(value="/addHomepagePicture")
	public ModelAndView addHomepagePicture(HttpSession session) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData> newPicturePathList = new ArrayList<PageData>();	//创建一个List来放图片的路径
		session.setAttribute("newPicturePathList" , newPicturePathList );
		
		mv.setViewName("trainingmanage/homepagepics/pictures_add");
		mv.addObject("pd", pd);
		return mv;
	}

	/**得到图片路径集合
	 * @param out
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping(value="/getPicturesName")
	public void getPicturesName(PrintWriter out,HttpSession session) throws Exception{
		List<PageData> pictureList = (List<PageData>) session.getAttribute("newPicturePathList");
		String picturesName = "";
		for(int i=0;i<pictureList.size();i++){
			String currentPath = (String) pictureList.get(i).get("PATH");
			if( i == 0){
				picturesName = currentPath;
			}else{
				picturesName = picturesName  + "," + currentPath ;
			}
		}
		out.write(picturesName);
		return ;
	}
	
	/**通过图片路径删除session/数据库tb_picture表/磁盘存储的图片信息
	 * @param out
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteOnePicture")
	public void deleteOnePicture(PrintWriter out,HttpSession session,String pictureName) throws Exception{
		List<PageData> pictureList = (List<PageData>) session.getAttribute("newPicturePathList");
		for(int i=0;i<pictureList.size();i++){
			if( pictureList.get(i).get("PATH").equals(pictureName.trim()) ){

				String PATH = (String) pictureList.get(i).get("PATH");													   //缩略图片路径
				String originalPATH = PATH.replaceAll("_.jpg", ".jpg")
						.replaceAll("_.png", ".png")
						.replaceAll("_.gif", ".gif")
						.replaceAll("_.jpeg", ".jpeg")
						.replaceAll("_.bmp", ".bmp");     //原图片路径
				DelAllFile.delFolder(PathUtil.getClasspath() + PATH ); 	           //删除缩略图
				DelAllFile.delFolder(PathUtil.getClasspath() + originalPATH ); 	   //删除原图
				
				pictureList.remove(i);
				break;
			}
		}
		session.setAttribute("newPicturePathList",pictureList);
		out.write("");
		return ;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpSession session) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Homepagepics");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		int maxSort = homepagepicsService.getMaxSort();	
		pd.put("SORT", maxSort+1);	//优先数
		pd.put("ADD_TIME", new Date());	//初始化添加时间
		pd.put("ADD_USER", Jurisdiction.getUsername() );	//添加人

		List<PageData> pictureList = (List<PageData>) session.getAttribute("newPicturePathList");
		for(int i=0;i<pictureList.size();i++){
			pd.put("HOMEPAGEPICS_ID", this.get32UUID());	//主键	
			pd.put("IMG_PATH", pictureList.get(i).get("PATH"));	//获取图片路径并保存
			homepagepicsService.save(pd);
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**置顶
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶homepagepics");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;}//校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd = homepagepicsService.findById( pd );
		pd = homepagepicsService.setTop(pd);
		homepagepicsService.edit(pd);
		
		out.write("success");
		out.close();
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Homepagepics");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = homepagepicsService.findById(pd);
		picturesService.delTpByPath( PathUtil.getClasspath() + pd.getString("IMG_PATH"));
		
		homepagepicsService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Homepagepics");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<PageData>	varList = homepagepicsService.list(page);	//列出Homepagepics列表
		
		mv.setViewName("trainingmanage/homepagepics/homepagepics_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd = homepagepicsService.findById(pd);	//根据ID读取
		mv.setViewName("trainingmanage/homepagepics/homepagepics_detail");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(HttpSession session)throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		List<Object> newPicturePathList = new ArrayList<Object>();	//创建一个List来放图片的路径
		session.setAttribute("newPicturePathList" , newPicturePathList );
		
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("trainingmanage/homepagepics/homepagepics_add");
		mv.addObject("msg", "save");	//去批量添加页面
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Homepagepics");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		

		
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			for(int i = 0;i<ArrayDATA_IDS.length;i++){
				PageData currentPageDate = new PageData();
				currentPageDate.put("HOMEPAGEPICS_ID", ArrayDATA_IDS[i]);
				currentPageDate = homepagepicsService.findById(currentPageDate);
				picturesService.delTpByPath(  PathUtil.getClasspath() + currentPageDate.get("IMG_PATH").toString() );
			}
			
			homepagepicsService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	
}
