package com.maker.dao;


import com.maker.dto.DynamicsCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Dynamics;

import java.util.List;

/**
 * Created by huangMP on 2016/11/18.
 * decription : 动态 的 Dao
 */
public interface DynamicsDao {

    /**
     * 插入一条信息
     * @param dynamics
     * @return 插入成功的数量
     */
    int insert(Dynamics dynamics) ;

    /**
     * @param dynamicsId
     * @return
     */
    Dynamics findByDynamicsId(String dynamicsId);

    /**
     * 按列查找 动态查找
     * @param queryCondition
     * @return
     */
    List<DynamicsCustom> findDynamicsByQueryCondition(QueryCondition queryCondition);

    /**
     * @param dynamics
     * @return
     */
    int update(Dynamics dynamics);
}
