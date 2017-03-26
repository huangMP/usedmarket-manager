package com.maker.controller.app;

import com.fh.service.makermanager.makercarousel.impl.MakerCarouselService;
import com.fh.util.PageData;
import com.maker.controller.BaseController;
import com.maker.dto.*;
import com.maker.entity.Carousel;
import com.maker.entity.SentenceBean;
import com.maker.entity.SubjectHead;
import com.maker.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description：首页展示数据的controller
 * Created by Peivxuan on 2016/11/27.
 */
@Controller
@RequestMapping("/AppHomePage")
public class HomePageController extends BaseController{

	/**
	 * 轮播图service
	 */
	@Resource(name = "makercarouselService")
	private MakerCarouselService makercarouselService;

	/**
	 * 单文字service
	 */
	@Resource(name = "sentenceService")
	private SentenceService sentenceService;

	/**
	 * 二手专题
	 */
	@Resource(name = "commodityCategoryService")
	private CommodityCategoryService commodityCategoryService;

	/**
	 * 动态
	 */
	@Resource(name = "dynamicsService")
	private DynamicsService dynamicsService;

	/**
	 * 众筹
	 */
	@Resource(name = "crowdfundingService")
	private CrowdfundingService crowdfundingService;

	/**
	 * 店铺
	 */
	@Resource(name = "storeService")
	private StoreService storeService;

	/**
	 * 标题头
	 */
	@Resource(name = "subjectHeadService")
	private SubjectHeadService subjectHeadService;

	@RequestMapping("/display")
	@ResponseBody
	public HttpResult HomePageDataDisplay (
			@RequestParam(value = "sentenceSize", defaultValue = "5") Integer sentenceSize,
			@RequestParam(value = "commodityCategorySize", defaultValue = "4") Integer commodityCategorySize,
			@RequestParam(value = "crowdfundinSize", defaultValue = "5")Integer crowdfundinSize,
			@RequestParam(value = "storeSize", defaultValue = "4")Integer storeSize,
			@RequestParam(value = "dynamicsSize", defaultValue = "5")Integer dynamicsSize) throws Exception {
		//五条轮播图
		List<PageData> carouselList = makercarouselService.selectTop5();
		//五条跑马条
		List<SentenceBean> sentenceBeanList = sentenceService.selectSentencesByCondition(new SentenceQueryCondition(1, 0, sentenceSize, false));
		//全部二手专题
		List<CommodityCategoryCustom> commoditycCategoryCustomList = commodityCategoryService.findByQueryCondition(new QueryCondition("type", "2", "", "DESC", "sort", 0, commodityCategorySize));
		//五条众筹
		List<CrowdfundingCustom> crowdfundingCustomList = crowdfundingService.findByQueryCondition(new QueryCondition("all", "", "", "DESC", "add_date", 0, crowdfundinSize));
		//五条动态
		List<DynamicsCustom> dynamicsCustomList = dynamicsService.findDynamicsByQueryCondition(new QueryCondition("all", "", "", "DESC", "add_date", 0,dynamicsSize));
		//店铺
		List<StoreCustom> storeList = storeService.findByQueryCondition(new QueryCondition("all", "", "", "DESC", "registration_date", 0, storeSize));
		//标题头
		List<SubjectHead> subjectHeadList = subjectHeadService.selectAll();

		return this.getHttpResult("", new HomePageData(
				carouselList,
				sentenceBeanList,
				commoditycCategoryCustomList,
				crowdfundingCustomList,
				dynamicsCustomList,
				storeList,
				subjectHeadList
		));
	}


}
