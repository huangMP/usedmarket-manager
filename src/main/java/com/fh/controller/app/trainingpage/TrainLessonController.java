package com.fh.controller.app.trainingpage;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.practice.PracticeManager;
import com.fh.service.trainingmanage.studydocument.StudyDocumentManager;
import com.fh.service.trainingmanage.video.VideoManager;
import com.fh.util.PageData;

/**
 * 我的课时
 * @author WangZK
 *
 */
@Controller
@RequestMapping(value="/train_lesson")
public class TrainLessonController extends BaseController {

	@Resource(name="lessonService")
	private LessonManager lessonService;
	@Resource(name="videoService")
	private VideoManager videoService;
	@Resource(name="studydocumentService")
	private StudyDocumentManager studydocumentService;
	@Resource(name="practiceService")
	private PracticeManager practiceService;
	
	/**
	 * 去到课时页面(视频页面)
	 */
	@RequestMapping(value="/goVideo")
	public ModelAndView goVideo() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		PageData lessonPd = new PageData();
		lessonPd = this.getPageData();
		
		lessonPd = lessonService.findById(lessonPd);
		
		PageData videoPd = new PageData();
		videoPd.put("LESSON_ID", lessonPd.getString("LESSON_ID"));
		videoPd = videoService.findByLessonId(videoPd);
		
		mv.setViewName("trainingpage/section_details/section_details_movie");
		mv.addObject("pd", videoPd);
		mv.addObject("LESSON_ID", lessonPd.getString("LESSON_ID"));
		return mv;
	}
	/**
	 * 去到文档页面
	 */
	@RequestMapping(value="/goDocument")
	public ModelAndView goDocument() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		PageData lessonPd = new PageData();
		lessonPd = this.getPageData();
		
		lessonPd = lessonService.findById(lessonPd);
		
		PageData documentPd = new PageData();
		documentPd.put("LESSON_ID", lessonPd.getString("LESSON_ID"));
		List<PageData> documentList = studydocumentService.findByLessonId(documentPd);
		
		for(int i=0;i<documentList.size();i++){
			documentList.get(i).put("ADD_TIME",new SimpleDateFormat("yyyy/MM/dd").format(documentList.get(i).get("ADD_TIME")));
			String file_path = documentList.get(i).getString("FILE_PATH");
			String substring = file_path.substring(file_path.lastIndexOf("."));
			String TITLE_PATH_NAME = documentList.get(i).getString("TITLE") + substring;
			documentList.get(i).put("TITLE_PATH_NAME",TITLE_PATH_NAME);
		}
		
		System.out.println(documentList.size());
		
		mv.setViewName("trainingpage/section_details/section_details_text");
		mv.addObject("documentList", documentList);
		mv.addObject("size",documentList.size());
		mv.addObject("LESSON_ID", lessonPd.getString("LESSON_ID"));
		return mv;
	}
	
	/**
	 * 去到练习页面
	 */
	@RequestMapping(value="/goPractice")
	public ModelAndView goPractice() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		PageData lessonPd = new PageData();
		lessonPd = this.getPageData();
		
		lessonPd = lessonService.findById(lessonPd);
		
		PageData practicePd = new PageData();
		practicePd.put("CHAPTER_ID", lessonPd.get("CHAPTER_ID") );
		List<PageData> practiceList = (List<PageData>) practiceService.findByChapterId( practicePd );
		
		int path_num = 0;
		
		try {
			String filePath = (String) practiceList.get(0).get("FILE_PATH");
			String answerPath = (String) practiceList.get(0).get("ANSWER_PATH");
			String fileHtmlPath = filePath.replaceAll( ".docx" , ".html" ).replaceAll( ".doc" , ".html" )  ;
			String answerHtmlPath = answerPath.replaceAll( ".docx" , ".html" ).replaceAll( ".doc" , ".html" )  ;
			mv.addObject("answerHtmlPath", answerHtmlPath );
			mv.addObject("fileHtmlPath", fileHtmlPath );
			path_num = (Integer) practiceList.get(0).get("CHOICE_NUM");
		} catch (IndexOutOfBoundsException e) {
			path_num = 0;
		}
		mv.addObject("PATH_NUM",path_num);
		
		mv.setViewName("trainingpage/section_details/section_details_test");
		mv.addObject("LESSON_ID", lessonPd.getString("LESSON_ID"));
		return mv;
	}
}
