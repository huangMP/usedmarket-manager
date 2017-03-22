package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.entity.UserCollection;
import com.maker.service.UserCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Description：收藏的controller
 * Created by Peivxuan on 2016/11/16.
 */
@Controller
@RequestMapping("/AppCollection")
public class UserCollectionController extends BaseController{

	@Resource(name = "userCollectionService")
	UserCollectionService userCollectionService;

	@RequestMapping(value = "/add")
	@ResponseBody
	public HttpResult addCollection(UserCollection userCollection) {
		userCollection.setCollectionId(this.get32UUID());
		if (userCollectionService.findOneCollection(userCollection) == null)
			return this.getFrequentlyUsedReturnResultByBool(userCollectionService.addCollection(userCollection));
		else
			return this.getHttpResult(BaseController.OPERATION_REPETITION,"");
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public HttpResult removeOneCollection(UserCollection userCollection) {
		return this.getFrequentlyUsedReturnResultByBool(userCollectionService.removeOneCollection(userCollection));
	}

}
