package com.maker.dao;

import com.maker.dto.QueryCondition;
import com.maker.entity.MakerRole;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户信息 Dao
 */
public interface MakerRoleDao {
    /**
     * 插入一条信息
     * @param role
     * @return 插入成功的数量
     */
    int insert(MakerRole role) ;

    /**
     * 通过roleName查找
     * @param roleName
     * @return
     */
    MakerRole findByRoleName(String roleName) ;

    /**
     * 查找
     * @param roleId
     * @return
     */
    MakerRole findByRoleId(String roleId) ;

    /**
     * 通过status查找
     * @param status
     * @return
     */
    List<MakerRole> findByStatus(String status) ;

    /**
     * 修改用户信息
     * @param role
     * @return 成功修改的信息条数
     */
    int update(MakerRole role);

    /**
     * 删除一条信息
     * @param roleId
     * @return 成功删除的信息条数
     */
    int delete(String roleId);

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    List<MakerRole> findByQueryCondition(QueryCondition queryCondition);
}
