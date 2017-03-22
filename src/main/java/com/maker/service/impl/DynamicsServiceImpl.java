package com.maker.service.impl;

import com.maker.dao.DynamicsDao;
import com.maker.dto.DynamicsCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Dynamics;
import com.maker.service.DynamicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 动态信息 Service层实现
 */
@Service("dynamicsService")
public class DynamicsServiceImpl implements DynamicsService {

    @Autowired
    DynamicsDao dynamicsDao;

    /**
     * 插入一条信息
     * @param dynamics
     * @return 插入成功的数量
     */
    @Override
    public boolean insert(Dynamics dynamics) {
        if( dynamicsDao.insert(dynamics) == 1 ){
            return true;
        }
        return false;
    }

    /**
     * @param dynamicsId
     * @return
     */
    @Override
    public Dynamics findByDynamicsId(String dynamicsId) {
        return dynamicsDao.findByDynamicsId( dynamicsId );
    }

    /**
     * 按列查找 动态查找
     * @param queryCondition
     * @return
     */
    public List<DynamicsCustom> findDynamicsByQueryCondition(QueryCondition queryCondition){
        return dynamicsDao.findDynamicsByQueryCondition(queryCondition);
    }

    @Override
    public boolean update(Dynamics dynamics) {
        if( 0 <= dynamicsDao.update( dynamics ) ){
            return false;
        }
        return true;
    }
}
