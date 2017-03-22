package com.maker.service.impl;

import com.maker.dao.CommentDao;
import com.maker.dto.CommentCustom;
import com.maker.entity.Comment;
import com.maker.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2016/11/3.
 */

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Resource(name = "commentDao")
	CommentDao commentDao;

	/**
	 * 插入一条信息
	 *
	 * @param comment
	 * @return 插入成功的数量
	 */
	@Override
	public boolean insert(Comment comment) {
		return commentDao.insert(comment);
	}

	/**
	 * 通过commodityId查找CommentCustom
	 *
	 * @param commodityId
	 * @return List<Comment>
	 */
	@Override
	public List<CommentCustom> findByCommodityId(String commodityId) {

		return commentDao.findByCommodityId(commodityId);
	}

	/**
	 * 通过crowdfundingId查找Comment
	 *
	 * @param crowdfundingId
	 * @return List<Comment>
	 */
	@Override
	public List<Comment> findByCrowdfundingId(String crowdfundingId) {
		return null;
	}

	/**
	 * 通过commentId查找Comment
	 *
	 * @param commentId
	 * @return Comment
	 */
	@Override
	public Comment findByCommentId(String commentId) {
		return null;
	}

	/**
	 * 修改用户信息
	 *
	 * @param comment
	 * @return 成功修改的信息条数
	 */
	@Override
	public int update(Comment comment) {
		return 0;
	}

	/**
	 * 删除通过commentId
	 *
	 * @param commentId
	 * @return 成功删除的信息条数
	 */
	@Override
	public boolean deleteByCommentId(String commentId) {
		return commentDao.deleteByCommentId(commentId);
	}

	/**
	 * 删除通过commodityId
	 *
	 * @param commodityId
	 * @return 成功删除的信息条数
	 */
	@Override
	public boolean deleteByCommodityId(String commodityId) {
		return commentDao.deleteByCommodityId(commodityId);
	}

	/**
	 * 删除通过crowdfundingId
	 *
	 * @param crowdfundingId
	 * @return 成功删除的信息条数
	 */
	@Override
	public boolean deleteByCrowdfundingId(String crowdfundingId) {
		return commentDao.deleteByCrowdfundingId(crowdfundingId);
	}
}
