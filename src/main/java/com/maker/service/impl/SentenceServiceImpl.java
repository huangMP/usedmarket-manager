package com.maker.service.impl;

import com.maker.dao.SentenceDao;
import com.maker.dto.SentenceQueryCondition;
import com.maker.entity.SentenceBean;
import com.maker.service.SentenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Description：单文字表的ServiceImpl（0.推荐；1.跑马条.）
 * Created by Peivxuan on 2016/11/26.
 */
@Service("sentenceService")
public class SentenceServiceImpl implements SentenceService {

	@Autowired
	private SentenceDao sentenceDao;

	/**
	 * 通过sentenceQueryCondition查找Sentence
	 *
	 * @param sentenceQueryCondition 查询条件
	 * @return 返回list
	 */
	@Override
	public List<SentenceBean> selectSentencesByCondition(SentenceQueryCondition sentenceQueryCondition) {
		if (sentenceQueryCondition.isDoRandom() == null || !sentenceQueryCondition.isDoRandom()) {
			return sentenceDao.selectSentencesByCondition(sentenceQueryCondition);
		}
		Integer numOfType = sentenceDao.selectNumByType(sentenceQueryCondition.getType());
		Integer showNum = sentenceQueryCondition.getNum();
		sentenceQueryCondition.setIndex(0);
		Random random = new Random();
		if (numOfType <= showNum) {
			List<SentenceBean> beanList = sentenceDao.selectSentencesByCondition(sentenceQueryCondition);
			return beanList;
		}
		if (numOfType >= (showNum << 1)) {
			int newShowNum = showNum << 1;
			//得到随机的下标（此下标确保能得到期望的num数）
			int randomIndex = random.nextInt(numOfType - newShowNum) ;
			sentenceQueryCondition.setIndex(randomIndex);
			//增加查找num数，以便于随机选取
			sentenceQueryCondition.setNum(newShowNum);
			List<SentenceBean> beanList = sentenceDao.selectSentencesByCondition(sentenceQueryCondition);
			return this.createRandomList(beanList, showNum);
		}

		//增加查找num数，以便于随机选取
		sentenceQueryCondition.setNum(numOfType);
		List<SentenceBean> beanList = sentenceDao.selectSentencesByCondition(sentenceQueryCondition);
		return this.createRandomList(beanList, showNum);
	}

	/**
	 * 随机获取rawList中的一半数据组成一个新的list返回
	 * @param rawList 原始list
	 * @param num 返回数目
	 * @return 新list
	 */
	private List<SentenceBean> createRandomList(List<SentenceBean> rawList, int num) {

		List<SentenceBean> newList = new ArrayList<SentenceBean>(num);

		Random random = new Random();
		int newNum = rawList.size();
		while( newList.size() < num ) {
			int nextInt = random.nextInt(newNum);
			if (!newList.contains(rawList.get(nextInt))) {
				newList.add(rawList.get(nextInt));
			}
		}
		return newList;
	}

	/**
	 * 插入
	 *
	 * @param sentenceBean 插入的bean
	 * @return 是否成功
	 */
	@Override
	public boolean insert(SentenceBean sentenceBean) {
		return sentenceDao.insert(sentenceBean);
	}

	/**
	 * 删除
	 *
	 * @param sentenceId 要删除的句子的id
	 * @return 是否成功
	 */
	@Override
	public boolean deleteBySentenceId(String sentenceId) {
		return sentenceDao.deleteBySentenceId(sentenceId);
	}

	/**
	 * 更新
	 *
	 * @param sentenceBean 更新的bean
	 * @return 是否成功
	 */
	@Override
	public boolean updateBySentenceId(SentenceBean sentenceBean) {
		return sentenceDao.updateBySentenceId(sentenceBean);
	}

	/**
	 * 查询类型的总数
	 *
	 * @param type 类型
	 * @return 返回数量
	 */
	@Override
	public Integer selectNumByType(Integer type) {
		return sentenceDao.selectNumByType(type);
	}
}
