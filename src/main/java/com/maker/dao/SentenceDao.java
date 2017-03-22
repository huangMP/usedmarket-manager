package com.maker.dao;

import com.maker.dto.SentenceQueryCondition;
import com.maker.entity.SentenceBean;

import java.util.List;

/**
 * Description：单文字Dao
 * Created by Peivxuan on 2016/11/26.
 */
public interface SentenceDao {

	/**
	 * 通过sentenceQueryCondition查找Sentence
	 * @param sentenceQueryCondition 查询条件
	 * @return 返回list
	 */
	List<SentenceBean> selectSentencesByCondition(SentenceQueryCondition sentenceQueryCondition);

	/**
	 * 插入
	 * @param sentenceBean 插入的bean
	 * @return 是否成功
	 */
	boolean insert(SentenceBean sentenceBean);

	/**
	 * 删除
	 * @param sentenceId 要删除的句子的id
	 * @return 是否成功
	 */
	boolean deleteBySentenceId(String sentenceId);

	/**
	 * 更新
	 * @param sentenceBean 更新的bean
	 * @return 是否成功
	 */
	boolean updateBySentenceId(SentenceBean sentenceBean);

	/**
	 * 查询类型的总数
	 * @param type 类型
	 * @return 返回数量
	 */
	Integer selectNumByType(Integer type);

}
