package com.maker.service.impl;

import com.maker.dao.StoreDao;
import com.maker.dto.QueryCondition;
import com.maker.dto.StoreCustom;
import com.maker.entity.Store;
import com.maker.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huangMP on 2016/11/27.
 * decription :
 */
@Service("storeService")
public class StoreServiceImpl implements StoreService {

    @Autowired
    StoreDao storeDao;

    @Override
    public int insert(Store store) {
        return storeDao.insert(store);
    }

    @Override
    public List<Store> findAll() {
        return storeDao.findAll();
    }

    public List<StoreCustom> findByQueryCondition(QueryCondition queryCondition) {
        return storeDao.findByQueryCondition(queryCondition);
    }
}
