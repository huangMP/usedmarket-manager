package com.fh.controller.app.trainingpage;

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
@RequestMapping(value="/train_app")
@Controller
public class TrainNavigationController extends BaseController {
    
	
	/**去首页
	 * @return
	 */
	@RequestMapping(value="/gotrain")
	@ResponseBody
	public ModelAndView goIndex(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/train_main");
		return mv;
	}
//	我的学习
	/**去我的学习-我的课程页面
	 * @return
	 */
	@RequestMapping(value="/gomylearn_class")
	@ResponseBody
	public ModelAndView goConnection(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/mylearn/mylearn_class");
		return mv;
	}
	/**去我的学习-我的考试页面
	 * @return
	 */
	@RequestMapping(value="/gomylearn_gotest")
	@ResponseBody
	public ModelAndView gomylearn_gotest(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/mylearn/mylearn_gotest");
		return mv;
	}
	/**去我的学习-成绩查询页面
	 * @return
	 */
	@RequestMapping(value="/gomylearn_check_score")
	@ResponseBody
	public ModelAndView gomylearn_check_score(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/mylearn/mylearn_check_score");
		return mv;
	}
	/**去我的学习-培训公告页面
	 * @return
	 */
	@RequestMapping(value="/gomylearn_notice")
	@ResponseBody
	public ModelAndView gomylearn_notice(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/mylearn/mylearn_notice");
		return mv;
	}
	/**去我的学习-考试页面
	 * @return
	 */
	@RequestMapping(value="/gomylearn_test")
	@ResponseBody
	public ModelAndView gomylearn_test(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/mylearn/mylearn_test");
		return mv;
	}
//章节详情
	/**去章节详情-视频页面
	 * @return
	 */
	@RequestMapping(value="/gosection_details_movie")
	@ResponseBody
	public ModelAndView gosection_details_movie(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/section_details/section_details_movie");
		return mv;
	}
	
	/**去章节详情-章节练习页面
	 * @return
	 */
	@RequestMapping(value="/gosection_details_test")
	@ResponseBody
	public ModelAndView gosection_details_test(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/section_details/section_details_test");
		return mv;
	}
	/**去章节详情-文档页面
	 * @return
	 */
	@RequestMapping(value="/gosection_details_text")
	@ResponseBody
	public ModelAndView gosection_details_text(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/section_details/section_details_text");
		return mv;
	}
	/**去章节详情-文档-详情页面
	 * @return
	 */
	@RequestMapping(value="/gosection_details_text_particular")
	@ResponseBody
	public ModelAndView gosection_details_text_particular(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/section_details/section_details_text_particular");
		return mv;
	}
//	全部课程
	/**去全部课程-课程详情-目录页面
	 * @return
	 */
	@RequestMapping(value="/gowholeclass_details_main")
	@ResponseBody
	public ModelAndView gowholeclass_details_main(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/wholeclass/wholeclass_details_main");
		return mv;
	}
	/**去全部课程-课程详情-讨论区页面
	 * @return
	 */
	@RequestMapping(value="/gowholeclass_details_talk")
	@ResponseBody
	public ModelAndView gowholeclass_details_talk(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/wholeclass/wholeclass_details_talk");
		return mv;
	}
	/**去全部课程-首页页面
	 * @return
	 */
	@RequestMapping(value="/gowholeclass_main")
	@ResponseBody
	public ModelAndView gowholeclass_main(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainingpage/wholeclass/wholeclass_main");
		return mv;
	}
}
	
 