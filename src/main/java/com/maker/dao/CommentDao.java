package com.maker.dao;


import com.maker.dto.CommentCustom;
import com.maker.dto.CommodityCustom;
import com.maker.entity.Comment;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 留言 CommentDao
 */
public interface CommentDao {
    /**
     * 插入一条信息
     * @param comment
     * @return 插入成功的数量
     */
    boolean insert(Comment comment) ;

    /**
     * 通过commodityId查找CommentCustom
     * @param commodityId
     * @return List<Comment>
     */
    List<CommentCustom> findByCommodityId(String commodityId) ;

    /**
     * 通过crowdfundingId查找Comment
     * @param crowdfundingId
     * @return List<Comment>
     */
    List<Comment> findByCrowdfundingId(String crowdfundingId) ;

    /**
     * 通过commentId查找Comment
     * @param commentId
     * @return Comment
     */
    Comment findByCommentId(String commentId) ;

    /**
     * 修改用户信息
     * @param comment
     * @return 成功修改的信息条数
     */
    int update(Comment comment);

    /**
     * 删除通过commentId
     * @param commentId
     * @return 成功删除的信息条数
     */
    boolean deleteByCommentId(String commentId);

    /**
     * 删除通过commodityId
     * @param commodityId
     * @return 成功删除的信息条数
     */
    boolean deleteByCommodityId(String commodityId) ;

    /**
     * 删除通过crowdfundingId
     * @param crowdfundingId
     * @return 成功删除的信息条数
     */
    boolean deleteByCrowdfundingId(String crowdfundingId) ;

	/**
	 * 通过一组商品id查找他们对应的评论
     */
    List<CommodityCustom> findCommentsByCommodityIds(List<CommodityCustom> commodityCustoms);
}
