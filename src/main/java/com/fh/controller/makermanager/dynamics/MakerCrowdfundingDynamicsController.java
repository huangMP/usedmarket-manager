package com.fh.controller.makermanager.dynamics;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.makermanager.crowdfunding.CrowdfundingManager;
import com.fh.service.makermanager.dynamics.WebDynamicsManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.maker.dto.CrowdfundingCustom;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.entity.Attachment;
import com.maker.entity.Dynamics;
import com.maker.service.AttachmentService;
import com.maker.service.CrowdfundingService;
import com.maker.service.DynamicsService;
import com.maker.util.MapUtils;
import com.maker.util.NarrowImage;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：众筹动态管理
 * 创建人：chengpeng
 * 创建时间：2017-03-14
 */
@Controller
@RequestMapping(value="MakerCrowdfundingDynamics")
public class MakerCrowdfundingDynamicsController extends BaseController {
	
	String menuUrl = "MakerCrowdfundingDynamics/list.do"; //菜单地址(权限用)
	@Resource(name="WebDynamicsService")
	private WebDynamicsManager makerDynamicsService;

	@Resource(name="WebCrowdfundingService")
	private CrowdfundingManager crowdfundingService;

	/**
	 * 非代码生成器
	 */
	@Autowired
	DynamicsService dynamicsService;

	@Autowired
	AttachmentService attachmentService;


	/**
	 * 查找还没有添加动态的众筹集合
	 * @return
	 */
	@RequestMapping(value = "/findCrowfundingNotDynamics")
	@ResponseBody
	public List<PageData> findCrowfundingNotDynamics(){
		PageData pd = new PageData();
		List<PageData>	varList = null;
		pd.put("HAS_DYNAMICS" , 2 );    // 筛选 是否有动态：2，没有；1有
		//pd.put("CROWDFUNDING_TYPE" , 1 );    // 筛选创意众筹 类别(1.创意众筹 2.爱心众筹)
		System.out.println(pd.get("HAS_DYNAMICS"));
		try {
			varList = crowdfundingService.listAll(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return varList ;
	}

	/**
	 * 跳转到新增动态页面
	 * @return Dynamics
	 */
	@RequestMapping(value = "/toInsert")
	@ResponseBody
	public ModelAndView toInsert(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("makermanager/dynamics/crowdfunding/add");
		return mv ;
	}

	/**
	 * 新增动态
	 * @param images
	 * @param title
	 * @param text
	 * @param pureText
	 * @param origin
	 * @return Dynamics
	 */
	@RequestMapping(value = "/insert")
	@ResponseBody
	public HttpResult insert(
			@RequestParam(value="images") MultipartFile[] images,
			String title,
			String text,
			String pureText,
			String origin ,
			String crowdfundingId
	){
		Dynamics dynamics = new Dynamics();
		dynamics.setDynamicsId( UuidUtil.get32UUID() );
		dynamics.setType( 3 );
		dynamics.setAddDate( new Date());
		dynamics.setTitle(title);
		dynamics.setText(text);
		dynamics.setPureText(pureText);
		dynamics.setOrigin(origin);
		dynamics.setAddUser( Jurisdiction.getUsername() ); //当前登录的用户名

		// 修改 相关众筹信息
		PageData pd = new PageData();
		pd.put( "CROWDFUNDING_ID" , crowdfundingId );
		try {
			PageData crowfunding = crowdfundingService.findById(pd);
			if( null != crowfunding){
				crowfunding.put( "DYNAMICS_ID" , dynamics.getDynamicsId() );
				crowfunding.put( "HAS_DYNAMICS" , 1 );
				crowdfundingService.edit(crowfunding);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


		if (!images[0].isEmpty()) {
			for (MultipartFile image : images) {
				if(!image.isEmpty()){
					attachmentService.insert(image, dynamics.getDynamicsId(), "5" , NarrowImage.normalNarrowTarget);
				}
			}
		}

		return getFrequentlyUsedReturnResultByBool(dynamicsService.insert(dynamics));
	}

	/**
	 * 跳转到修改动态页面
	 * @return Dynamics
	 */
	@RequestMapping(value = "/toEdit")
	@ResponseBody
	public ModelAndView toEdit(String dynamicsId ){
		Dynamics dynamics = dynamicsService.findByDynamicsId(dynamicsId);
		if(null != dynamics){
			ModelAndView mv = new ModelAndView();
			mv.addObject("dynamics",dynamics);
			mv.addObject("images", attachmentService.findByContentId(dynamicsId) );
			mv.setViewName("makermanager/dynamics/crowdfunding/edit");
			return mv;
		}
		return null;
	}

	/**
	 * 更新修改
	 * @return
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public HttpResult update() {
		PageData pd = this.getPageData();
		try {
			makerDynamicsService.edit(pd);
			return this.getHttpResult(this.OPERATION_SUCCESS , pd );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.getHttpResult(this.OPERATION_FAILED , pd );
	}

	/**
	 * 通过dynamicsId跳转到展示页面
	 * @param dynamicsId
	 * @return Dynamics
	 */
	@RequestMapping(value = "/display")
	@ResponseBody
	public ModelAndView display(String dynamicsId){
		ModelAndView mv = this.getModelAndView();
		Dynamics dynamics = dynamicsService.findByDynamicsId(dynamicsId);
		if(null != dynamics){
			 mv.setViewName("makermanager/dynamics/display") ;
			 mv.addObject("dynamics", dynamics);
			return mv ;
		}
		return null;
	}

	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Dynamics");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		makerDynamicsService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Dynamics");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}

		pd.put("type", 3 ); // 通过type 筛选 众筹动态

		page.setPd(pd);
		List<PageData>	varList = makerDynamicsService.list(page);	//列出Dynamics列表

		for(int i = 0 ; i < varList.size() ; i++){
			PageData item = varList.get(i);
			String itemId = (String) item.get("DYNAMICS_ID");
			List<Attachment> images = attachmentService.findByContentId(itemId);
			item.put("IMAGES",images);
		}

		mv.setViewName("makermanager/dynamics/crowdfunding/list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Dynamics");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			makerDynamicsService.deleteAll(ArrayDATA_IDS);
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
