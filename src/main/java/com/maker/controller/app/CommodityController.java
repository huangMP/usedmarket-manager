package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.CommodityQueryCondition;
import com.maker.dto.HttpResult;
import com.maker.entity.Commodity;
import com.maker.service.AttachmentService;
import com.maker.service.CommodityService;
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
 * Description：商品的控制器
 * Created by Peivxuan on 2016/10/24.
 */

@Controller
@RequestMapping("/AppCommodity")
public class CommodityController extends BaseController{

	@Autowired
	CommodityService commodityService;

	@Autowired
	AttachmentService attachmentService;

	@RequestMapping(value = "/search")
	@ResponseBody
	public HttpResult searchCommodityByCondition(CommodityQueryCondition commodityQueryCondition) {
		return this.getHttpResult("", this.commodityService.findCommodityByQueryCondition(commodityQueryCondition));
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public HttpResult deleteCommodity(String commodityId) {
		attachmentService.deleteByContentId(commodityId);
		return this.getFrequentlyUsedReturnResultByBool(commodityService.deleteByCommodityId(commodityId));
	}

	@RequestMapping(value = "/updateCommodityNum")
	@ResponseBody
	public HttpResult updateNumByCommodityId(Commodity commodity) {
		return this.getFrequentlyUsedReturnResultByBool(commodityService.updateNumByCommodityId(commodity));
	}

	@RequestMapping(value = "/upload")
	@ResponseBody
	public HttpResult uploadCommodity(@RequestParam(value = "images") MultipartFile[] images,
									  String userId,
									  String commodityName,
									  String category,
									  @RequestParam(value = "price", defaultValue = "0") double price,
									  @RequestParam(value = "amount", defaultValue = "0") int amount,
									  String description,
									  String location,
									  @RequestParam(value = "status", defaultValue = "0") int status) {
		Commodity commodity = new Commodity(
				UuidUtil.get32UUID(),
				userId,
				commodityName,
				category,
				price,
				amount,
				description,
				location,
				0,
				new Date(),
				0,
				status
		);

		if (!images[0].isEmpty()) {
			for (MultipartFile image : images) {
				//执行上传
				attachmentService.insert(image, commodity.getCommodityId(), "1" , NarrowImage.normalNarrowTarget);
			}
		}

		return this.getFrequentlyUsedReturnResultByBool(commodityService.addCommodity(commodity));

	}

}
