package com.maker.service;

import com.maker.entity.SubjectHead;

import java.util.List;

/**
 * Description：标题头service
 * Created by Peivxuan on 2016/11/29.
 */
public interface SubjectHeadService {

	/**
	 * 查找所有标题头
	 * @return 返回标题头list
	 */
	List<SubjectHead> selectAll();

	/**
	 * 插入一个标题头
	 * @param subjectHead 要添加的标题头
	 * @return 是否成功
	 */
	boolean insert(SubjectHead subjectHead);

	/**
	 * 通过标题头id删除标题头
	 * @param subjectHeadId 标题头id
	 * @return 是否成功
	 */
	boolean deleteBySubjectHeadId(String subjectHeadId);

	/**
	 * 通过标题头id更新
	 * @param subjectHead 要更新的标题头
	 * @return 是否成功
	 */
	boolean updateBySubjectHeadId(SubjectHead subjectHead);

}
