package com.fh.controller.trainingmanage.special;

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
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.trainingmanage.insiderecommended.InsiderecommendedManager;
import com.fh.service.trainingmanage.paper.PaperManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 说明：专题管理
 * 创建人：peixuan
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/special")
public class SpecialController extends BaseController {
	
	String menuUrl = "special/list.do"; //菜单地址(权限用)
	@Resource(name="specialService")
	private SpecialManager specialService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	@Resource(name="paperService")
	private PaperManager paperService;
	
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="BRIEF_INTRO",required=false) String BRIEF_INTRO,
			@RequestParam(value="ORIGINAL_PAPER",required=false) String ORIGINAL_PAPER,
			@RequestParam(value="ANOTHER_PAPER",required=false) String ANOTHER_PAPER
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Special");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		String imageUrl = null;
		if(image.getSize()>0){
	        String uploadPath ="/static/images";		
			String realUploadPath = session.getServletContext().getRealPath(uploadPath);
			imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
			session.removeAttribute("image");
		}
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		/*-↓↓↓↓↓↓↓↓-start-↓↓↓↓↓↓-向pd域中添加属性-↓↓↓↓↓↓↓↓↓↓↓↓-*/
		pd.put("SPECIAL_ID", this.get32UUID());	//主键
		pd.put("IMG_PATH", imageUrl);
		pd.put("TITLE", TITLE);
		pd.put("BRIEF_INTRO", BRIEF_INTRO);
		pd.put("ORIGINAL_PAPER", ORIGINAL_PAPER);
		pd.put("ANOTHER_PAPER", ANOTHER_PAPER);
		pd.put("ADD_TIME", new Date());
		pd.put("ADD_USER", Jurisdiction.getUsername());
		/*-↑↑↑↑↑↑↑↑-end-↑↑↑↑↑↑-向pd域中添加属性-↑↑↑↑↑↑↑↑↑↑↑↑-*/
		
		specialService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Special");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = specialService.findById(pd);
		if(pd.get("IMG_PATH")!=null){
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
			singleImgService.delete(realPath);
		}
		
		specialService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="imgChange",required=false) String imgChange,
			@RequestParam(value="SPECIAL_ID",required=false) String SPECIAL_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="BRIEF_INTRO",required=false) String BRIEF_INTRO,
			@RequestParam(value="ORIGINAL_PAPER",required=false) String ORIGINAL_PAPER,
			@RequestParam(value="ANOTHER_PAPER",required=false) String ANOTHER_PAPER,
			@RequestParam(value="ADD_TIME",required=false) Date ADD_TIME,
			@RequestParam(value="ADD_USER",required=false) String ADD_USER
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Special");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("SPECIAL_ID", SPECIAL_ID);
		pd = specialService.findById(pd);
		
		/*-↓↓↓↓↓↓↓↓-start-↓↓↓↓↓↓-修改pd域中属性-↓↓↓↓↓↓↓↓↓↓↓↓-*/
		pd.put("TITLE", TITLE);
		pd.put("BRIEF_INTRO", BRIEF_INTRO);
		pd.put("ORIGINAL_PAPER", ORIGINAL_PAPER);
		pd.put("ANOTHER_PAPER", ANOTHER_PAPER);
		//图片更新
		String imageUrl = null;
		if(image!=null){
	        String uploadPath ="/static/images";		
			String realUploadPath = session.getServletContext().getRealPath(uploadPath);
			imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
			pd.put("IMG_PATH", imageUrl);//覆盖
			session.removeAttribute("image");
		}else {
			System.out.println(imgChange);
			if(imgChange!=null){//前台页面点击了重新选择图片，只是没有选图片
				pd.put("IMG_PATH", null);//覆盖
			}
		}
		/*-↑↑↑↑↑↑↑↑-end-↑↑↑↑↑↑-修改pd域中属性-↑↑↑↑↑↑↑↑↑↑↑↑-*/
		
		specialService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Special");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = specialService.list(page);	//列出Special列表
		PageData pdPaper = new PageData();
		pdPaper.put("PAPER_ID", "");
		pdPaper.put("TITLE", "");
		List<PageData> mypaper = paperService.findPaperNamesAndID(pdPaper);
		for (PageData paper : mypaper) {
			String title = (String)paper.get("TITLE");
			String paperId = (String)paper.get("PAPER_ID");
			for(PageData special : varList) {
				String originalId = (String)special.get("ORIGINAL_PAPER");
				String anotherId = (String)special.get("ANOTHER_PAPER");
				if(paperId.equals(originalId)) {
					special.put("ORIGINAL_PAPER", title);
				}
				if(paperId.equals(anotherId)) {
					special.put("ANOTHER_PAPER", title);
				}
			}
		}
		
		if(varList != null){
			for(int i = 0; i < varList.size();i++ ) {
				try {
					if(varList.get(i).getString("BRIEF_INTRO").length()>8)
					{
						String text = varList.get(i).getString("BRIEF_INTRO").substring(0, 8)+"......";
						varList.get(i).put("BRIEF_INTRO", text);
					}
				} catch(NullPointerException e) {
					varList.get(i).put("BRIEF_INTRO", null);
				}
			}
		}
		
		mv.setViewName("trainingmanage/special/special_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
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
		mv.setViewName("trainingmanage/special/special_edit");
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
		pd = specialService.findById(pd);	//根据ID读取
		PageData pdPaper = new PageData();
		pdPaper.put("PAPER_ID", "");
		pdPaper.put("TITLE", "");
		pdPaper.put("SPECIAL_ID",(String)pd.get("SPECIAL_ID"));
		List<PageData> mypaper = paperService.findPaperNamesAndID(pdPaper);
		mv.setViewName("trainingmanage/special/special_edit");
		mv.addObject("mypaper", mypaper);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
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
		pd = specialService.findById(pd);	//根据ID读取
		PageData pdPaper = new PageData();
		pdPaper.put("PAPER_ID", "");
		pdPaper.put("TITLE", "");
		pdPaper.put("SPECIAL_ID",(String)pd.get("SPECIAL_ID"));
		List<PageData> mypaper = paperService.findPaperNamesAndID(pdPaper);
		mv.setViewName("trainingmanage/special/special_detail");
		mv.addObject("mypaper", mypaper);
		mv.addObject("msg", "detail");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Special");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for (String id : ArrayDATA_IDS) {
				PageData eachpd = new PageData();
				eachpd.put("SPECIAL_ID", id);
				eachpd = specialService.findById(eachpd);
				if(eachpd.get("IMG_PATH") != null){
					String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
					singleImgService.delete(realPath);
				}
			}
			specialService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
