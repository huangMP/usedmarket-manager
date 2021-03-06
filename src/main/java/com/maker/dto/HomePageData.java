package com.maker.dto;

import com.maker.entity.Carousel;
import com.maker.entity.SentenceBean;
import com.maker.entity.SubjectHead;

import java.util.List;

/**
 * Description：首页展示数据
 * Created by Peivxuan on 2016/11/27.
 */
public class HomePageData {

	/**
	 * 轮播图
	 */
	private List<Carousel> carouselList;

	/**
	 * 跑马条
	 */
	private List<SentenceBean> sentenceBeanList;

	/**
	 * 二手专题
	 */
	private List<CommodityCategoryCustom> secondHandSpecialCustomList;

	/**
	 * 众筹
	 */
	private List<CrowdfundingCustom> crowdfundingCustomList;

	/**
	 * 动态
	 */
	private List<DynamicsCustom> dynamicsCustomList;

	/**
	 * 店铺
	 */
	private List<StoreCustom> storeCustomsList;

	/**
	 * 标题头
	 */
	private List<SubjectHead> subjectHeadList;

	public HomePageData() {
	}

	public HomePageData(List<Carousel> carouselList, List<SentenceBean> sentenceBeanList, List<CommodityCategoryCustom> secondHandSpecialCustomList, List<CrowdfundingCustom> crowdfundingCustomList, List<DynamicsCustom> dynamicsCustomList, List<StoreCustom> storeCustomsList, List<SubjectHead> subjectHeadList) {
		this.carouselList = carouselList;
		this.sentenceBeanList = sentenceBeanList;
		this.secondHandSpecialCustomList = secondHandSpecialCustomList;
		this.crowdfundingCustomList = crowdfundingCustomList;
		this.dynamicsCustomList = dynamicsCustomList;
		this.storeCustomsList = storeCustomsList;
		this.subjectHeadList = subjectHeadList;
	}

	public List<StoreCustom> getStoreCustomsList() {
		return storeCustomsList;
	}

	public void setStoreCustomsList(List<StoreCustom> storeCustomsList) {
		this.storeCustomsList = storeCustomsList;
	}

	public List<Carousel> getCarouselList() {
		return carouselList;
	}

	public void setCarouselList(List<Carousel> carouselList) {
		this.carouselList = carouselList;
	}

	public List<SentenceBean> getSentenceBeanList() {
		return sentenceBeanList;
	}

	public void setSentenceBeanList(List<SentenceBean> sentenceBeanList) {
		this.sentenceBeanList = sentenceBeanList;
	}

	public List<CommodityCategoryCustom> getSecondHandSpecialCustomList() {
		return secondHandSpecialCustomList;
	}

	public void setSecondHandSpecialCustomList(List<CommodityCategoryCustom> secondHandSpecialCustomList) {
		this.secondHandSpecialCustomList = secondHandSpecialCustomList;
	}

	public List<CrowdfundingCustom> getCrowdfundingCustomList() {
		return crowdfundingCustomList;
	}

	public void setCrowdfundingCustomList(List<CrowdfundingCustom> crowdfundingCustomList) {
		this.crowdfundingCustomList = crowdfundingCustomList;
	}

	public List<DynamicsCustom> getDynamicsCustomList() {
		return dynamicsCustomList;
	}

	public void setDynamicsCustomList(List<DynamicsCustom> dynamicsCustomList) {
		this.dynamicsCustomList = dynamicsCustomList;
	}

	public List<SubjectHead> getSubjectHeadList() {
		return subjectHeadList;
	}

	public void setSubjectHeadList(List<SubjectHead> subjectHeadList) {
		this.subjectHeadList = subjectHeadList;
	}

	@Override
	public String toString() {
		return "HomePageData{" +
				"carouselList=" + carouselList +
				", sentenceBeanList=" + sentenceBeanList +
				", secondHandSpecialCustomList=" + secondHandSpecialCustomList +
				", crowdfundingCustomList=" + crowdfundingCustomList +
				", dynamicsCustomList=" + dynamicsCustomList +
				", storeCustomsList=" + storeCustomsList +
				", subjectHeadList=" + subjectHeadList +
				'}';
	}
}
