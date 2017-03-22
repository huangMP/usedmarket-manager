package com.maker.service.impl;

import com.maker.dao.SubjectHeadDao;
import com.maker.entity.SubjectHead;
import com.maker.service.SubjectHeadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2016/11/29.
 */
@Service("subjectHeadService")
public class SubjectHeadServiceImpl implements SubjectHeadService {

	@Autowired
	private SubjectHeadDao subjectHeadDao;

	/**
	 * 查找所有标题头
	 *
	 * @return 返回轮播图list
	 */
	@Override
	public List<SubjectHead> selectAll() {
		return subjectHeadDao.selectAll();
	}

	/**
	 * 插入一个标题头
	 *
	 * @param subjectHead 要添加的轮播图
	 * @return 是否成功
	 */
	@Override
	public boolean insert(SubjectHead subjectHead) {
		return subjectHeadDao.insert(subjectHead);
	}

	/**
	 * 通过标题头id删除标题头
	 *
	 * @param subjectHeadId 轮播图id
	 * @return 是否成功
	 */
	@Override
	public boolean deleteBySubjectHeadId(String subjectHeadId) {
		return subjectHeadDao.deleteBySubjectHeadId(subjectHeadId);
	}

	/**
	 * 通过标题头id更新
	 *
	 * @param subjectHead 要更新的标题头
	 * @return 是否成功
	 */
	@Override
	public boolean updateBySubjectHeadId(SubjectHead subjectHead) {
		return subjectHeadDao.updateBySubjectHeadId(subjectHead);
	}

}
