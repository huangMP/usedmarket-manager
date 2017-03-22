package com.maker.dao;

import com.maker.dto.CommodityCustom;
import com.maker.dto.CommodityQueryCondition;
import com.maker.dto.ImageCustom;
import com.maker.entity.Commodity;

import java.util.List;

/**
 * Description：商品dao
 * Created by Peivxuan on 2016/10/23.
 */
public interface CommodityDao {

	/**
	 * 插入商品
	 * @param product 商品
	 * @return 返回是否插入成功
	 */
	boolean insert(Commodity product);

	/**
	 * 通过商品id删除商品
	 * @param commodityId 商品id
	 * @return
	 */
	boolean deleteByCommodityId(String commodityId);

	/**
	 * 通过商品id更新商品
	 * @param commodityId 商品id
	 * @return
	 */
	boolean updateByCommodityId(String commodityId);

	/**
	 * 通过商品id查找商品
	 * @param commodityId
	 * @return
	 */
	Commodity findByCommodityId(String commodityId);

	/**
	 * 通过种类查找商品
	 * @param commodityQueryCondition 查找条件
	 * @return
	 */
	List<CommodityCustom> findCommodityByQueryCondition(CommodityQueryCondition commodityQueryCondition);

	/**
	 * 读取图片
	 * @param commodityCustom 需要其中的commodityId
	 * @return
	 */
	List<ImageCustom> loadImages(List<CommodityCustom> commodityCustom);

	/**
	 * 更新常用数据 --> 数量、销量、收藏人数、价格
	 * @param commodity 商品
	 * @return
	 */
	boolean updateNumByCommodityId(Commodity commodity);

}
