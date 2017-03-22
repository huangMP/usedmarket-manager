package com.maker.service.impl;

import com.maker.dao.CommodityCategoryDao;
import com.maker.dto.CommodityCategoryCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.CommodityCategory;
import com.maker.service.CommodityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huangMP on 2016/11/24.
 * decription : Service层实现
 */
@Service("commodityCategoryService")
public class CommodityCategoryServiceImpl implements CommodityCategoryService {

    @Autowired
    CommodityCategoryDao commodityCategoryDao;

    @Override
    public boolean insert(CommodityCategory commodityCategory) {
        return 1 == commodityCategoryDao.insert(commodityCategory)? true : false ;
    }

    @Override
    public boolean delete(String commodityCategoryId) {
        return 1 == commodityCategoryDao.delete(commodityCategoryId) ? true : false ;
    }

    @Override
    public CommodityCategory findByCommodityCategoryId(String commodityCategoryId) {
        return commodityCategoryDao.findByCommodityCategoryId(commodityCategoryId);
    }

    @Override
    public CommodityCategoryCustom findCommodityCategoryCustomByCommodityCategoryId(String commodityCategoryId) {
        return commodityCategoryDao.findCommodityCategoryCustomByCommodityCategoryId(commodityCategoryId);
    }

    @Override
    public List<CommodityCategoryCustom> findAll() {
        return commodityCategoryDao.findAll();
    }

    /**
     * 修改
     * @param commodityCategory
     * @return
     */
    public boolean update(CommodityCategory commodityCategory){
        return 1 == commodityCategoryDao.update(commodityCategory) ? true : false ;
    }


    /**
     * 条件查询
     * @param queryCondition
     * @return
     */
    public List<CommodityCategoryCustom> findByQueryCondition(QueryCondition queryCondition){
        return commodityCategoryDao.findByQueryCondition(queryCondition);
    }
}
