package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.entity.Comment;
import com.maker.service.CommentService;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2016/11/3.
 */

@Controller
@RequestMapping("/AppComment")
public class CommentsController extends BaseController{

	@Resource(name="commentService")
	CommentService commentService;

	@RequestMapping(value = "/searchByCommodityId")
	@ResponseBody
	public HttpResult searchCommentByCommodityId(String commodityId) {
		return this.getHttpResult("",this.commentService.findByCommodityId(commodityId));
	}

	@RequestMapping(value = "/insert")
	@ResponseBody
	public HttpResult insert(Comment comment) {
		comment.setCommentId(UuidUtil.get32UUID());
		comment.setCommentDate(new Date());
		return this.getFrequentlyUsedReturnResultByBool(commentService.insert(comment));
	}

	@RequestMapping(value = "/deleteByCommentId")
	@ResponseBody
	public HttpResult deleteByCommentId(String commodityId) {
		return this.getFrequentlyUsedReturnResultByBool(commentService.deleteByCommentId(commodityId));
	}

	@RequestMapping(value = "/deleteByCommodityId")
	@ResponseBody
	public HttpResult deleteByCommodityId(String commodityId) {
		return this.getFrequentlyUsedReturnResultByBool(commentService.deleteByCommodityId(commodityId));
	}

}
