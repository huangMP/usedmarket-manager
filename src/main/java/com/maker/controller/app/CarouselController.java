package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.entity.Carousel;
import com.maker.service.AttachmentService;
import com.maker.service.CarouselService;
import com.maker.util.NarrowImage;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Description：轮播图Controller
 * Created by Peivxuan on 2016/11/26.
 */
@Controller
@RequestMapping("/AppCarousel")
public class CarouselController extends BaseController {

		@Autowired
		AttachmentService attachmentService;
		@Autowired
		private CarouselService carouselService;

		@RequestMapping(value = "/upload")
		@ResponseBody
		public HttpResult uploadCommodity(@RequestParam(value = "image") MultipartFile image, String title ) {
			Carousel carousel = new Carousel(
					UuidUtil.get32UUID(),
					title,
					new Date(),
					0
			);

			//暂时设置为空
			carousel.setAddUserId("test");

			if (!image.isEmpty()) {
				attachmentService.insert(image, carousel.getCarouselId(), "3", NarrowImage.bigNarrowTarget);
			} else {
				return this.getHttpResult(BaseController.OPERATION_FAILED,"");
			}
			return this.getFrequentlyUsedReturnResultByBool(carouselService.insert(carousel));
		}

		@RequestMapping(value = "/top5")
		@ResponseBody
		public HttpResult selectTop5() {
			return this.getHttpResult ("",carouselService.selectTop5());
		}

		@RequestMapping(value = "/delete")
		@ResponseBody
		public HttpResult deleteByCarouselId(String carouselId) {
			return this.getFrequentlyUsedReturnResultByBool(carouselService.deleteByCarouselId(carouselId));
		}

		@RequestMapping(value = "/update")
		@ResponseBody
		public HttpResult updateByCarouselId(Carousel carousel) {
			return this.getFrequentlyUsedReturnResultByBool(carouselService.updateByCarouselId(carousel));
		}

	}

