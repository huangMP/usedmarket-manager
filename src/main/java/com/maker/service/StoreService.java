package com.maker.service;

import com.maker.dto.QueryCondition;
import com.maker.dto.StoreCustom;
import com.maker.entity.Store;

import java.util.List;

/**
 * Created by huangMP on 2016/11/27.
 * decription :
 */
public interface StoreService {
    int insert(Store store);

    List<Store> findAll();

    List<StoreCustom> findByQueryCondition(QueryCondition queryCondition);

}
