package com.fh.controller.pagemanage.photoalbum;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.DelAllFile;
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
 * 说明：图集介绍
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 */
@Controller
@RequestMapping(value="/photoalbum")
public class PhotoAlbumController extends BaseController {
	
	String menuUrl = "photoalbum/list.do"; //菜单地址(权限用)
	@Resource(name="photoalbumService")
	private PhotoAlbumManager photoalbumService;
	@Resource(name="picturesService")
	private PicturesManager picturesService;
	
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
				DelAllFile.delFolder(PathUtil.getClasspath() +  PATH ); 	           //删除缩略图
				DelAllFile.delFolder(PathUtil.getClasspath() +  originalPATH ); 	   //删除原图
				
				pictureList.remove(i);
				break;
			}
		}
		session.setAttribute("newPicturePathList",pictureList);
		out.write("");
		return ;
	}
	
	/**置顶
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶PhotoAlbum");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;}//校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd = photoalbumService.findById( pd );
		pd = photoalbumService.setTop(pd);
		photoalbumService.edit(pd);
		
		out.write("success");
		out.close();
	}
	
	/**保存 
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PhotoAlbum");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PHOTOALBUM_ID", this.get32UUID());	//主键
		int maxSort = photoalbumService.getMaxSort();	
		pd.put("SORT", maxSort+1);	//优先数
		pd.put("BROWSING_TIMES", 0);	//浏览数初始化默认为0
		pd.put("ADD_TIME", new Date());	//初始化添加时间
		pd.put("ADD_USER", Jurisdiction.getUsername() );	//添加人
		photoalbumService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除PhotoAlbum");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = photoalbumService.findById( pd );
		String itemPicturesPath = pd.getString("IMAGE_ID_COLLECTION");
		String[] itemPicturesPathList = itemPicturesPath.split(",");
		for(int i=0;i<itemPicturesPathList.length;i++){
			picturesService.delTpByPath( PathUtil.getClasspath() + itemPicturesPathList[i]);
		}
		
		photoalbumService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PhotoAlbum");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		photoalbumService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表PhotoAlbum");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
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
		
		for(int i = 0;i<varList.size();i++){
			String itemPicturesPath = varList.get(i).getString("IMAGE_ID_COLLECTION");
			String[] itemPicturesPathList = itemPicturesPath.split(",");
			varList.get(i).put("IMAGE_ID_COLLECTION",itemPicturesPathList);
		}
		
		mv.setViewName("pagemanage/photoalbum/photoalbum_list");
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
		pd = photoalbumService.findById(pd);	//根据ID读取
		
			String itemPicturesPath = pd.getString("IMAGE_ID_COLLECTION");
			String[] itemPicturesPathList = itemPicturesPath.split(",");
			pd.put("IMAGE_ID_COLLECTION",itemPicturesPathList);
		
		
		mv.setViewName("pagemanage/photoalbum/photoalbum_detail");
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
		
		List<PageData> newPicturePathList = new ArrayList<PageData>();	//创建一个List来放图片的路径
		session.setAttribute("newPicturePathList" , newPicturePathList );
		
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("pagemanage/photoalbum/photoalbum_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit( HttpSession session )throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = photoalbumService.findById(pd);	//根据ID读取
		
		
		String itemPicturesPath = pd.getString("IMAGE_ID_COLLECTION");
		
		String[] itemPicturesPathList = itemPicturesPath.split(",");
		pd.put("IMAGE_ID_COLLECTION",itemPicturesPathList);
		
		List<PageData> newPicturePathList = new ArrayList<PageData>();	//创建一个List来放图片
		for(int i=0;i<itemPicturesPathList.length;i++){
			PageData picturePageData = new PageData();
			picturePageData.put("PATH", itemPicturesPathList[i] );
			newPicturePathList.add( picturePageData );
		}
		session.setAttribute("newPicturePathList" , newPicturePathList );	
		
		mv.setViewName("pagemanage/photoalbum/photoalbum_edit");
		mv.addObject("msg", "edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PhotoAlbum");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			for(int i = 0;i<ArrayDATA_IDS.length;i++){ //删除图片
				PageData currentPageDate = new PageData();
				currentPageDate.put("PHOTOALBUM_ID", ArrayDATA_IDS[i]);
				currentPageDate = photoalbumService.findById(currentPageDate);

				String itemPicturesPath = currentPageDate.getString("IMAGE_ID_COLLECTION");
				String[] itemPicturesPathList = itemPicturesPath.split(",");
				for(int j=0;j<itemPicturesPathList.length;j++){
					picturesService.delTpByPath( PathUtil.getClasspath() + itemPicturesPathList[j]);
				}
				
			}
			
			photoalbumService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
}
