package com.maker.service.impl;

import com.maker.dao.CommentDao;
import com.maker.dao.CommodityDao;
import com.maker.dto.CommodityCustom;
import com.maker.dto.CommodityQueryCondition;
import com.maker.dto.ImageCustom;
import com.maker.entity.Commodity;
import com.maker.service.AttachmentService;
import com.maker.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description：商品service实现类
 * Created by Peivxuan on 2016/10/24.
 */
@Service("commodityService")
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	CommodityDao commodityDao;

	@Autowired
	CommentDao commentDao;

	@Autowired
	AttachmentService attachmentService;

	/**
	 * 添加商品
	 *
	 * @param product 新增的商品
	 * @return
	 */
	@Override
	public boolean addCommodity(Commodity product) {
		return commodityDao.insert(product);
	}

	/**
	 * 通过商品id删除商品
	 *
	 * @param commodityId 商品id
	 * @return
	 */
	@Override
	public boolean deleteByCommodityId(String commodityId) {
		attachmentService.deleteByContentId(commodityId);
		return commodityDao.deleteByCommodityId(commodityId);
	}

	/**
	 * 通过商品id更新商品,不更新数量、收藏人数、销量
	 *
	 * @param commodityId 商品id
	 * @return
	 */
	@Override
	public boolean updateByCommodityId(String commodityId) {
		return commodityDao.updateByCommodityId(commodityId);
	}

	/**
	 * 通过商品id查找商品
	 *
	 * @param commodityId
	 * @return
	 */
	@Override
	public Commodity findByCommodityId(String commodityId) {
		return commodityDao.findByCommodityId(commodityId);
	}

	/**
	 * 通过条件查找商品
	 *
	 * @param commodityQueryCondition 查询条件
	 * @return
	 */
	@Override
	public List<CommodityCustom> findCommodityByQueryCondition(CommodityQueryCondition commodityQueryCondition) {
		if (commodityQueryCondition.getOrder() == null || "".equals(commodityQueryCondition.getOrder().trim())) {
			commodityQueryCondition.setOrder("DESC");
		}
		if (commodityQueryCondition.getOrderBy() == null || "".equals(commodityQueryCondition.getOrderBy().trim())) {
			commodityQueryCondition.setOrderBy("launch_date");
		}
		if (commodityQueryCondition.getType() != null && ! "all".equals(commodityQueryCondition.getType().trim())) {
			if ("launch_date".equals(commodityQueryCondition.getOrderBy().trim())) {
				if("ASC".equals(commodityQueryCondition.getOrder())) {
					commodityQueryCondition.setOrder("DESC");
				} else {
					commodityQueryCondition.setOrder("ASC");
				}
			}
		}
		//取出10条commodity
		List<CommodityCustom> commodityCustoms = commodityDao.findCommodityByQueryCondition(commodityQueryCondition);
		//找出10条commodity的图片
		if (commodityCustoms.size() == 0) {
			return commodityCustoms;
		}
		List<ImageCustom> imageCustoms = commodityDao.loadImages(commodityCustoms);
		List<CommodityCustom> commentsByCommodityIds = commentDao.findCommentsByCommodityIds(commodityCustoms);
		//10commodity填入images与comment
		for (int i = 0; i < commodityCustoms.size(); i++) {
			//对比commodityId填入image
			for (int j = 0; j < imageCustoms.size(); j++) {
				if (commodityCustoms.get(i).getCommodityId().equals(imageCustoms.get(j).getCommodityId())) {
					commodityCustoms.get(i).setImages(imageCustoms.get(j).getImages());
					break;
				}
			}
			//对比commodityId填入comment
			for (int k = 0; k < commentsByCommodityIds.size(); k++) {
				if (commodityCustoms.get(i).getCommodityId().equals(commentsByCommodityIds.get(k).getCommodityId())) {
					commodityCustoms.get(i).setComments(commentsByCommodityIds.get(k).getComments());
					break;
				}
			}
		}

		return commodityCustoms;
	}

	/**
	 * 更新常用数据 --> 数量、销量、收藏人数、价格
	 *
	 * @param commodity 商品
	 * @return
	 */
	@Override
	public boolean updateNumByCommodityId(Commodity commodity) {
		return commodityDao.updateNumByCommodityId(commodity);
	}


}
