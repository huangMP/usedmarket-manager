package com.fh.controller.app.frontpage;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.util.AppUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;


/**@author liangzhilin
 * 前台页面链接跳转类
 */
@RequestMapping(value="/app_index")
@Controller
public class AppNavigationController extends BaseController {
    
	
	/**去首页
	 * @return
	 */
	@RequestMapping(value="/goindex")
	@ResponseBody
	public ModelAndView goIndex(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/homepage");
		return mv;
	}
	/**去联系我们页面
	 * @return
	 */
	@RequestMapping(value="/goconnection")
	@ResponseBody
	public ModelAndView goConnection(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/connection");
		return mv;
	}
	
	/*局馆介绍*/
	/**去局馆荣誉页面
	 * @return
	 */
	@RequestMapping(value="/goArchiveHonor")
	@ResponseBody
	public ModelAndView goArchiveHonor(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveIntroduction/ArchiveHonor");
		return mv;
	}
	/**去局馆风貌页面
	 * @return
	 */
	@RequestMapping(value="/goArchiveScene")
	@ResponseBody
	public ModelAndView goArchiveScene(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveIntroduction/ArchiveScene");
		return mv;
	}
	/**去领导关怀页面
	 * @return
	 */
	@RequestMapping(value="/goLeadershipConcern")
	@ResponseBody
	public ModelAndView goLeadershipConcern(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveIntroduction/LeadershipConcern");
		return mv;
	}
	/**去领导班子页面
	 * @return
	 */
	@RequestMapping(value="/goLeadershipRanks")
	@ResponseBody
	public ModelAndView goLeadershipRanks(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveIntroduction/LeadershipRanks");
		return mv;
	}
	/**去机构职能页面
	 * @return
	 */
	@RequestMapping(value="/goMechanismFunction")
	@ResponseBody
	public ModelAndView goMechanismFunction(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveIntroduction/MechanismFunction");
		return mv;
	}
	/**去局馆介绍页面
	 * @return
	 */
	@RequestMapping(value="/goArchiveIntroduction")
	@ResponseBody
	public ModelAndView goArchiveIntroduction(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveIntroduction/ArchiveIntroduction");
		return mv;
	}
	
	
	/*档案动态*/
	/**去通知公告页面
	 * @return
	 */
	@RequestMapping(value="/goNotice")
	@ResponseBody
	public ModelAndView goNotice(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveDynamic/Notice");
		return mv;
	}
	/**去他山之石页面
	 * @return
	 */
	@RequestMapping(value="/goOtherInformation")
	@ResponseBody
	public ModelAndView goOtherInformation(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveDynamic/OtherInformation");
		return mv;
	}
	/**去工作动态页面
	 * @return
	 */
	@RequestMapping(value="/goWorkDynamics")
	@ResponseBody
	public ModelAndView goWorkDynamics(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/ArchiveDynamic/WorkDynamics");
		return mv;
	}
	
	/*业务指导*/
	/**去业务指南页面
	 * @return
	 */
	@RequestMapping(value="/goBusinessGuide")
	@ResponseBody
	public ModelAndView goBusinessGuide(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/BusinessGuidance/BusinessGuide");
		return mv;
	}
	/**去业务培训页面
	 * @return
	 */
	@RequestMapping(value="/goBusinessTraining")
	@ResponseBody
	public ModelAndView goBusinessTraining(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/BusinessGuidance/BusinessTraining");
		return mv;
	}
	/**去在线报名页面
	 * @return
	 */
	@RequestMapping(value="/goOnlineRegistration")
	@ResponseBody
	public ModelAndView goOnlineRegistration(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/BusinessGuidance/OnlineRegistration");
		return mv;
	}
	
	/* 公共服务 */
	/**去查档服务指南页面
	 * @return
	 */
	@RequestMapping(value="/goserviceinformation")
	@ResponseBody
	public ModelAndView goServiceInformation(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/PublicService/ServiceInformation");
		return mv;
	}
	/**去服务预约页面
	 * @return
	 */
	@RequestMapping(value="/goserviceappointment")
	@ResponseBody
	public ModelAndView goServiceAppointment(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/PublicService/ServiceAppointment");
		return mv;
	}
	
	/* 法规与标准 */
	/**去法规页面
	 * @return
	 */
	@RequestMapping(value="/goregulations")
	@ResponseBody
	public ModelAndView goRegulations(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/Regulations_Standards/Regulations");
		return mv;
	}
	/**去标准页面
	 * @return
	 */
	@RequestMapping(value="/gostandards")
	@ResponseBody
	public ModelAndView goStandards(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/Regulations_Standards/Standards");
		return mv;
	}
	/**去相关文件页面
	 * @return
	 */
	@RequestMapping(value="/gorelateddocuments")
	@ResponseBody
	public ModelAndView goRelatedDocuments(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/Regulations_Standards/RelatedDocuments");
		return mv;
	}
	/* 利用中心 */
	/**去电子档案页面
	 * @return
	 */
	@RequestMapping(value="/goelearchives")
	@ResponseBody
	public ModelAndView goEleArchives(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/UseCenter/Ele-Archives");
		return mv;
	}
	/**去开放目录页面
	 * @return
	 */
	@RequestMapping(value="/goopendirectory")
	@ResponseBody
	public ModelAndView OpenDirectory(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/UseCenter/OpenDirectory");
		return mv;
	}
	/**去利用实例页面
	 * @return
	 */
	@RequestMapping(value="/gousecase")
	@ResponseBody
	public ModelAndView goUseCase(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/UseCenter/UseCase");
		return mv;
	}
	/* 网上展厅 */
	/*
	 * @return
	 */
	@RequestMapping(value="/goexhition")
	@ResponseBody
	public ModelAndView goexhition(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/OnlineExhibition/Topic");
		return mv;
	}
	/* 详情*/
	/**去文本详情页面
	 * @return
	 */
	@RequestMapping(value="/gotext")
	@ResponseBody
	public ModelAndView gotext(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/text");
		return mv;
	}
	/**去相册详情页面
	 * @return
	 */
	@RequestMapping(value="/goimgtext")
	@ResponseBody
	public ModelAndView goimgtext(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("frontpage/img_text");
		return mv;
	}
	
}
	
 