package com.fh.controller.pagemanage.exhibition;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.pagemanage.exhibition.ExhibitionManager;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.pagemanage.subject.SubjectManager;

/** 
 * 说明：网上展厅
 * 创建人：liangzhilin
 * 创建时间：2016-08-19
 */
@Controller
@RequestMapping(value="/exhibition")
public class ExhibitionController extends BaseController {
	
	String menuUrl = "exhibition/list.do"; //菜单地址(权限用)
	@Resource(name="exhibitionService")
	private ExhibitionManager exhibitionService;
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="SUBJECT_ID",required=false) String SUBJECT_ID,
			@RequestParam(value="LINK",required=false) String LINK,
			@RequestParam(value="TITLE",required=false) String TITLE
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Exhibition");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		
		String imageUrl = null;
		if(image!=null){
			if(image.getSize()>0){
		        String uploadPath ="/static/images";		
				String realUploadPath = session.getServletContext().getRealPath(uploadPath);
				imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
				session.removeAttribute("image");
			}
		}
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EXHIBITION_ID", this.get32UUID());	//主键
		pd.put("TITLE", TITLE);
		pd.put("LINK", LINK);
		pd.put("SUBJECT_ID", SUBJECT_ID);
		pd.put("ADD_TIME", new Date());
		pd.put("ADD_USER", Jurisdiction.getUsername());
		pd.put("IMG_PATH", imageUrl);
		exhibitionService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Exhibition");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = exhibitionService.findById(pd);
		if(pd.get("IMG_PATH")!=null){
			String folderPath ="/images";		
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
			singleImgService.delete(realPath);
		}
		exhibitionService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="EXHIBITION_ID",required=false) String EXHIBITION_ID,
			@RequestParam(value="SUBJECT_ID",required=false) String SUBJECT_ID,
			@RequestParam(value="LINK",required=false) String LINK,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="imgChange",required=false) String imgChange
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Exhibition");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EXHIBITION_ID", EXHIBITION_ID);
		pd = exhibitionService.findById(pd);
		pd.put("SUBJECT_ID", SUBJECT_ID);
		pd.put("LINK", LINK);
		pd.put("TITLE", TITLE);
		
		//图片更新
		String imageUrl = null;
		System.out.println(image);
		if(image!=null){
			//删除原来的图片
			if(pd.get("IMG_PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
				singleImgService.delete(realPath);
			}
			if(image.getSize()>0){
		        String uploadPath ="/static/images";		
				String realUploadPath = session.getServletContext().getRealPath(uploadPath);
				imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
				pd.put("IMG_PATH", imageUrl);//覆盖
				session.removeAttribute("image");
			}else {
				if(imgChange!=null){//前台页面点击了重新选择图片，只是没有选图片
					pd.put("IMG_PATH", null);//覆盖
				}
		    }
		}
		
		exhibitionService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Exhibition");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdSubject = new PageData();
		pdSubject.put("SUBJECT_ID", "");
		pdSubject.put("SUBJECT_NAME", "");
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			System.out.println(keywords);
			pd.put("keywords", keywords.trim());
		}
		List<PageData> subjects = subjectService.listSubjectNames(pdSubject);
		page.setPd(pd);
		List<PageData>	varList = exhibitionService.list(page);	//列出Exhibition列表
		mv.setViewName("pagemanage/exhibition/exhibition_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("subjects", subjects);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdSubject = new PageData();
		pdSubject.put("SUBJECT_ID", "");
		pdSubject.put("SUBJECT_NAME", "");
		List<PageData> subjects = subjectService.listSubjectNames(pdSubject);
		mv.addObject("subjects", subjects);
		mv.setViewName("pagemanage/exhibition/exhibition_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = exhibitionService.findById(pd);	//根据ID读取
		PageData pdSubject = new PageData();
		pdSubject.put("SUBJECT_ID", "");
		pdSubject.put("SUBJECT_NAME", "");
		List<PageData> subjects = subjectService.listSubjectNames(pdSubject);
		mv.setViewName("pagemanage/exhibition/exhibition_edit");
		mv.addObject("subjects", subjects);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Exhibition");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			exhibitionService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 置顶
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶Exhibition");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		exhibitionService.editMaxSort(pd);
		out.write("success");
		System.out.println("success");
		out.close();
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
		pd = exhibitionService.findById(pd);	//根据ID读取
		PageData pdSubject = new PageData();
		pdSubject.put("SUBJECT_ID", "");
		pdSubject.put("SUBJECT_NAME", "");
		List<PageData> subjects = subjectService.listSubjectNames(pdSubject);
		mv.setViewName("pagemanage/exhibition/exhibition_detail");
		mv.addObject("subjects", subjects);
		mv.addObject("msg", "detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
