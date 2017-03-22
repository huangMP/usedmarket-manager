package com.fh.controller.app.trainingpage;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.PageBean;
import com.fh.entity.system.User;
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.classandspecial.ClassAndSpecialManager;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.paper.PaperManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.service.trainingmanage.userandspecial.UserAndSpecialManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 说明：专题 创建人：shunc 创建时间：2016-09-02
 */
@Controller
@RequestMapping(value = "/train_special")
public class TrainSpecialController extends BaseController {

	@Resource(name = "specialService")
	private SpecialManager specialService;
	@Resource(name = "userandspecialService")
	private UserAndSpecialManager userAndSpecialService;
	@Resource(name = "classandspecialService")
	private ClassAndSpecialManager classAndSpecialService;
	@Resource(name = "traininguserService")
	private TraininguserManager traininguserService;
	@Resource(name = "chapterService")
	private ChapterManager chapterService;
	@Resource(name = "lessonService")
	private LessonManager lessonService;
	@Resource(name = "paperService")
	private PaperManager paperService;

	/**
	 * 全部专题列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/special_list")
	public @ResponseBody
	PageBean allSpecialList(PageBean page) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute("TRAIN_USER");// 获取user


		List<PageData> varList = new ArrayList(); // 列表

		if (user.getSKIN() != null) {
			System.out.println(user.getSKIN());
			// 添加学员专题
			page.setPd(pd);
			List<PageData> specialList = specialService.list(page);
			for (int i = 0; i < specialList.size(); i++) {

				PageData addData = new PageData(); // 列表
				addData.put("SPECIAL_ID",
						specialList.get(i).getString("SPECIAL_ID"));
				addData.put("IMG_PATH", specialList.get(i)
						.getString("IMG_PATH"));
				addData.put("TITLE", specialList.get(i).getString("TITLE"));

				varList.add(addData);
			}
		}

		page.setPds(varList);
		return page;

	}

	/**
	 * 我的专题列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/myspecial_list")
	public @ResponseBody
	PageBean mySpecialList(PageBean page) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute("TRAIN_USER");// 获取user

		List<PageData> varList = new ArrayList(); // 列表

		if (user.getSKIN() != null) {
			System.out.println(user.getSKIN());
			// 添加学员专题
			pd.put("CLASSDETAIL_ID", user.getSKIN());// 添加CLASSDETAIL_ID
			page.setPd(pd);
			List<PageData> specialList = classAndSpecialService
					.listAddSpecial(page);// 找已添加的专题
			for (int i = 0; i < specialList.size(); i++) {

				PageData addData = new PageData(); // 列表
				addData.put("SPECIAL_ID",
						specialList.get(i).getString("SPECIAL_ID"));
				addData.put("IMG_PATH", specialList.get(i)
						.getString("IMG_PATH"));
				addData.put("TITLE", specialList.get(i).getString("TITLE"));

				varList.add(addData);
			}
		}

		page.setPds(varList);
		return page;

	}

	/**
	 * goto 专题视频
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/goSpecial")
	public ModelAndView goSpecial() throws Exception {
		ModelAndView mv = new ModelAndView();

		PageData specialPd = new PageData();
		specialPd = this.getPageData();

		specialPd = specialService.findById(specialPd);

		PageData chapterPd = new PageData();
		chapterPd.put("SPECIAL_ID", specialPd.getString("SPECIAL_ID"));
		List<PageData> chapterList = chapterService
				.findChaptersBySpecialId(chapterPd);
		for (int i = 0; i < chapterList.size(); i++) {
			PageData lessonPd = new PageData();
			lessonPd.put("CHAPTER_ID",
					chapterList.get(i).getString("CHAPTER_ID"));
			List<PageData> lessonList = lessonService
					.findLessonsByChapterId(lessonPd);
			chapterList.get(i).put("lessonList", lessonList);
		}

		mv.setViewName("trainingpage/wholeclass/wholeclass_details_main");
		mv.addObject("specialPd", specialPd);
		mv.addObject("chapterList", chapterList);
		return mv;
	}

	/**
	 * 去到讨论区
	 */
	@RequestMapping(value = "/goDiscussion")
	public ModelAndView goDiscussion() throws Exception {
		ModelAndView mv = new ModelAndView();

		PageData specialPd = new PageData();
		specialPd = this.getPageData();

		specialPd = specialService.findById(specialPd);

		mv.setViewName("trainingpage/wholeclass/wholeclass_details_talk");
		mv.addObject("specialPd", specialPd);
		return mv;
	}

	/**
	 * 去到考试去
	 */
	@RequestMapping(value = "/goTest")
	public @ResponseBody PageBean goTest(PageBean pageBean) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute("TRAIN_USER");// 获取user

		pd.put("USER_ID", user.getUSER_ID());// 将USER_ID设置到PageData中

		pageBean.setPd(pd);

		// 通过USER_ID查询userandspecial表，获取其中的SPECIAL_ID
		List<PageData> varList = userAndSpecialService.findByUserId(pageBean);

		for (int i = 0; i < varList.size(); i++) {
			// 通过SPECIAL_ID去查询试卷
			PageData specialPd = new PageData();
			specialPd.put("SPECIAL_ID", varList.get(i).getString("SPECIAL_ID"));
			specialPd = specialService.findById(specialPd);
			varList.get(i).put("TITLE", specialPd.getString("TITLE"));
		}

		pageBean.setPds(varList);

		return pageBean;
	}

	/**
	 * 考试页面
	 */
	@RequestMapping(value = "/test")
	public ModelAndView test() throws Exception {
		ModelAndView mv = new ModelAndView();

		PageData pd = new PageData();
		pd = this.getPageData();

		String status = pd.getString("STATUS");

		pd = specialService.findById(pd);
		// 试卷路径
		String fileHtmlPath = "";

		PageData paperPd;
		
		try {
			paperPd = new PageData();
			if (status.equals("0")) {
				if (pd.getString("ORIGINAL_PAPER").trim() == "") {
					throw new NullPointerException();
				}
				paperPd.put("PAPER_ID", pd.getString("ORIGINAL_PAPER"));
				paperPd = paperService.findById(paperPd);
				String filePath = paperPd.getString("FILE_PATH");
				fileHtmlPath = filePath.replaceAll(".docx", ".html").replaceAll(".doc", ".html");
			} else if (status.equals("4")) {
				if (pd.getString("ANOTHER_PAPER").trim() == "") {
					throw new NullPointerException();
				}
				paperPd.put("PAPER_ID", pd.getString("ANOTHER_PAPER"));
				paperPd = paperService.findById(paperPd);
				String filePath = paperPd.getString("FILE_PATH");
				fileHtmlPath = filePath.replaceAll(".docx", ".html").replaceAll(".doc", ".html");
			}
		} catch (NullPointerException e) {
			paperPd = new PageData();
			paperPd.put("PAPER_ID", "");
		}
		// TODO 除了0、4的情况未加入
		
		//存放special_id
		paperPd.put("SPECIAL_ID", pd.getString("SPECIAL_ID"));
		//存放status
		paperPd.put("STATUS", status);
		mv.addObject("fileHtmlPath", fileHtmlPath);
		mv.setViewName("trainingpage/mylearn/mylearn_test");
		mv.addObject("pd", paperPd);
		return mv;
	}

	/**
	 * 保存考生考试答案
	 */
	@RequestMapping(value = "/saveAnswer")
	public ModelAndView saveAnswer() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		/*获取user_id*/
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute("TRAIN_USER");// 获取user
		String USER_ID = user.getUSER_ID();
		
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String[] choice_answer = division(pd.getString("CHOICE_ANSWER"));
		
		PageData paperPd = new PageData();
		//设置PAPER_ID
		paperPd.put("PAPER_ID", pd.getString("PAPER_ID"));
		//通过PAPER_ID查询到数据
		paperPd = paperService.findById(paperPd);
		//通过division方法获得答案数组
		String[] rightKey = division(paperPd.getString("CHOICE_ANSWER"));
		
		//设置选择题总分
		float total = 0;
		//获取单选题每道题的分数
		float score = Integer.parseInt(paperPd.getString("CHOICE_GRADE"));
		for (int i = 0; i < rightKey.length; i++) {
			//判断答案是否正确，如果正确加分
			if(rightKey[i].equals(choice_answer[i])){
				total = total + score;
			}
		}
		
		String[] rightDoubleKey = division(paperPd.getString("CHOICE_DOUBLE_ANSWER"));
		
		List<Integer> trueAnswer = judgeMCQ(paperPd.getString("CHOICE_DOUBLE_ANSWER"), pd.getString("CHOICE_DOUBLE_ANSWER"), (Integer) paperPd.get("CHOICE_DOUBLE_NUM"));
		
		float doubleScore = Integer.parseInt(paperPd.getString("CHOICE_DOUBLE_GRADE"));
		for (int i = 0; i < rightDoubleKey.length; i++) {
			if(trueAnswer.get(i)<rightDoubleKey[i].length() && trueAnswer.get(i)>0){
				total = total + doubleScore/2;
			} else if (trueAnswer.get(i) == rightDoubleKey[i].length()){
				total = total + doubleScore;
			}
		}
		
		
		PageData userandspecialPd = new PageData();
		//设置userId
		pd.put("USER_ID", USER_ID);
		//获得userandspecaialId
		userandspecialPd = userAndSpecialService.findByUserIdAndSpecialId(pd);
		//设置userandspecaialId进入pd
		pd.put("USERANDSPECIAL_ID", userandspecialPd.getString("USERANDSPECIAL_ID"));
		//设置用户的答案
		pd.put("CHOICE_ANSWER", pd.getString("CHOICE_ANSWER")+pd.getString("CHOICE_DOUBLE_ANSWER"));
		//设置分数
		pd.put("CHOICE_GRADE", total);
		//设置状态
		pd.put("STATUS", Integer.parseInt(pd.getString("STATUS"))+1+"");
		//设置日期
		pd.put("SUBMIT_TIME", new Date());
		//设置答案
		userAndSpecialService.edit(pd);
		
		mv.setViewName("trainingpage/mylearn/mylearn_gotest");
		return mv;
	}
	
	//将字符串分割之后放入数组
	private String[] division(String answer){
		
		int num = 0;
		for (int i = 0; i < answer.length(); i++) {
			if(answer.charAt(i) == '|'){
				num++;
			}
		}
		
		int i = 0;
		String[] choice_answer = new String[num];
		while(answer.length()>0){
			int index = answer.indexOf("|");
			choice_answer[i] = answer.substring(0, index);
			answer = answer.substring(index+1, answer.length());
			i++;
		}
		
		return choice_answer;
	}
	
	
	/**
	 * 成绩查询页面
	 */
	@RequestMapping(value = "/goCheck")
	public ModelAndView goCheck() throws Exception {
		ModelAndView mv = new ModelAndView();

		PageData pd = new PageData();
		PageData paperPd = new PageData();
		pd = this.getPageData();

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute("TRAIN_USER");// 获取user
		String USER_ID = user.getUSER_ID();
		
		pd.put("USER_ID", USER_ID);
		
		pd = userAndSpecialService.findByUserIdAndSpecialId(pd);
		
		paperPd.put("PAPER_ID", pd.getString("PAPER_ID"));
		paperPd = paperService.findById(paperPd);
		

		mv.setViewName("trainingpage/mylearn/mylearn_check_score");
		mv.addObject("pd",pd);
		mv.addObject("paperPd", paperPd);
		return mv;
	}
	
	/**
	 * 判断多选题
	 * 
	 * @param ansStr
	 *            答案字符串
	 * @param userStr
	 *            用户答案字符串
	 * @param choiceNum
	 *            题目个数
	 * @return 
	 * 			list中存放对应题目答题正确的个数，
	 */
	public List<Integer> judgeMCQ(String ansStr, String userStr, int choiceNum) {
		// 答题的情况，不包含错题
		List<Integer> rightCount = new ArrayList<Integer>();
		// 标准答案字符串,转换为大写
		String ansstr = ansStr.toUpperCase();
		// 用户答案字符串
		String userstr = userStr.toUpperCase();
		// 存放答案的list
		List<String> answerList;
		// 将标准答案每一题分割
		String[] ansStrings = ansstr.split("\\|");
		// 将用户答案每一题分割
		String[] userStrings = userstr.split("\\|");
		for (int j = 0; j < choiceNum; j++) {
			// 用户答案个数大于标准答案个数，则此题错误
			if (userStrings[j].length() > ansStrings[j].length()) {
				rightCount.add(0);
				continue;
			}
			// 将一个答案内的选项拆分
			String[] answer = ansStrings[j].split("");
			// 将一个答案内的选项拆分
			String[] userAnswer = userStrings[j].split("");
			// 存放答案的list
			answerList = new ArrayList<String>();
			// 将字符串数组转换为list
			for (String temp : answer) {
				// 不为空则纳入list
				if (!"".equals(temp)) {
					answerList.add(temp);
				}
			}
			// 正确答案的个数
			int rightNum = 0;
			// 用户答案的length，作为循环的次数
			int runNum = userAnswer.length;
			// 循环判断用户所填答案是否正确
			for (int i = 0; i < runNum; i++) {
				// 如果有空字符，则不向下执行
				if ("".equals(userAnswer[i])) {
					continue;
				}
				// 答案list中是否存在用户所填写的答案，是的话将其删除，并且正确答案个数自增
				if (answerList.remove(userAnswer[i])) {
					rightNum++;
				} else {
					// 如果不存在，则表示此题错误
					rightNum = 0;
					break;
				}
			}
			rightCount.add(rightNum);

		}
		return rightCount;
	}
	
}
