package com.maker.service;

import com.maker.dto.CommodityCustom;
import com.maker.dto.CommodityQueryCondition;
import com.maker.entity.Commodity;

import java.util.List;

/**
 * Created by peivxuan on 2016/10/24.
 * decription : 商品的 Service层接口
 */
public interface CommodityService {

    /**
     * 添加商品
     * @param product 新增的商品
     * @return
     */
    boolean addCommodity(Commodity product);

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
     * 通过条件查找商品
     * @param commodityQueryCondition 查询条件
     * @return
     */
    List<CommodityCustom> findCommodityByQueryCondition(CommodityQueryCondition commodityQueryCondition);

    /**
     * 更新常用数据 --> 数量、销量、收藏人数、价格
     * @param commodity 商品
     * @return
     */
    boolean updateNumByCommodityId(Commodity commodity);

}
