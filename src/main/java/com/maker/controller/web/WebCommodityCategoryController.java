package com.maker.controller.web;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.entity.CommodityCategory;
import com.maker.service.AttachmentService;
import com.maker.service.CommodityCategoryService;
import com.maker.util.NarrowImage;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * Created by huangMP on 2016/11/24.
 * decription : controller
 */
@Controller
@RequestMapping("/WebCommodityCategory")
public class WebCommodityCategoryController extends BaseController{

    @Autowired
    CommodityCategoryService commodityCategoryService;
    @Autowired
    AttachmentService attachmentService;

    /**
     * @param
     * @return
     */
    @RequestMapping(value = "/insert")
    @ResponseBody
    public HttpResult insert(
            @RequestParam(value="picture") MultipartFile picture,
            @RequestParam(value="type") int type,
            @RequestParam(value="title") String title,
            @RequestParam(value="sort") int sort ) {
        CommodityCategory commodityCategory = new CommodityCategory();
        commodityCategory.setCommodityCategoryId(UuidUtil.get32UUID());
        commodityCategory.setAddDate(new Date());
        commodityCategory.setSort(sort);
        commodityCategory.setType(type);
        commodityCategory.setTitle(title);
        //设置添加人 获取当前登录的用户
        //commodityCategory.setAddUserId();

        String attachmentId = attachmentService.insert(picture, commodityCategory.getCommodityCategoryId(), "3" , NarrowImage.normalNarrowTarget);
        commodityCategory.setAttachmentId(attachmentId);    //设置附件Id

        return getFrequentlyUsedReturnResultByBool(commodityCategoryService.insert(commodityCategory));
    }

    /**
     * @param commodityCategoryId
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public HttpResult delete(String commodityCategoryId) {
        attachmentService.deleteByContentId(commodityCategoryId);
        return getFrequentlyUsedReturnResultByBool(commodityCategoryService.delete(commodityCategoryId));
    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @RequestMapping(value = "/findByQueryCondition")
    @ResponseBody
    public HttpResult findByQueryCondition(QueryCondition queryCondition) {
        return getHttpResult(this.OPERATION_SUCCESS,commodityCategoryService.findByQueryCondition(queryCondition));
    }

    /**
     * 修改
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public HttpResult update(
            @RequestParam(value="commodityCategoryId") String commodityCategoryId,
            @RequestParam(value="picture") MultipartFile picture,
            @RequestParam(value="title") String title,
            @RequestParam(value="sort",defaultValue = "0") int sort ) {
        CommodityCategory commodityCategoryInDatabase = commodityCategoryService.findByCommodityCategoryId(commodityCategoryId);
        commodityCategoryInDatabase.setSort(sort);
        commodityCategoryInDatabase.setTitle(title);

        if( 1 != attachmentService.delete(commodityCategoryInDatabase.getAttachmentId())){
            return getHttpResult("修改失败",commodityCategoryInDatabase);
        }
        String attachmentId = attachmentService.insert(picture, commodityCategoryInDatabase.getCommodityCategoryId(), "3" , NarrowImage.normalNarrowTarget);
        commodityCategoryInDatabase.setAttachmentId(attachmentId);    //设置附件Id

        return getFrequentlyUsedReturnResultByBool(commodityCategoryService.update(commodityCategoryInDatabase));
    }


}