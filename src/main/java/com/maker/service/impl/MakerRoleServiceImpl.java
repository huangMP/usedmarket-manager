package com.maker.service.impl;

import com.maker.dao.MakerRoleDao;
import com.maker.dto.QueryCondition;
import com.maker.entity.MakerRole;
import com.maker.service.MakerRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huangMP on 2016/11/22.
 * decription : 角色信息 Service层实现
 */
@Service("makerRoleService")
public class MakerRoleServiceImpl implements MakerRoleService {

    @Autowired
    MakerRoleDao roleDao;

    @Override
    public boolean insert(MakerRole role) {
        return 1 == roleDao.insert(role) ? true : false ;
    }

    @Override
    public MakerRole findByRoleName(String roleName) {
        return roleDao.findByRoleName(roleName);
    }

    @Override
    public MakerRole findByRoleId(String roleId) {
        return roleDao.findByRoleId(roleId);
    }

    @Override
    public List<MakerRole> findByStatus(String status) {
        return roleDao.findByStatus(status);
    }

    @Override
    public boolean update(MakerRole role) {
        return 1 == roleDao.update(role) ? true : false ;
    }

    @Override
    public boolean delete(String roleId) {
        return 1 == roleDao.delete(roleId) ? true : false ;
    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    public List<MakerRole> findByQueryCondition(QueryCondition queryCondition){
        return roleDao.findByQueryCondition(queryCondition);
    }
}
