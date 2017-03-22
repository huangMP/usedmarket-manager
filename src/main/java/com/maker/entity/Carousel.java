package com.maker.entity;

import java.util.Date;

/**
 * Description：轮播图实体类
 * Created by Peivxuan on 2016/11/26.
 */
public class Carousel {


	/**
	 * 轮播图id
	 */
	private String carouselId;

	/**
	 * 附件路径
	 */
	private String imagePath;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 添加人
	 */
	private String addUserId;

	/**
	 * 添加日期
	 */
	private Date addDate;

	/**
	 * 优先数
	 */
	private Integer sort;

	public Carousel(String carouselId, String title, Date addDate, Integer sort) {
		this.carouselId = carouselId;
		this.title = title;
		this.addDate = addDate;
		this.sort = sort;
	}

	public Carousel(){}

	public String getCarouselId() {
		return carouselId;
	}

	public void setCarouselId(String carouselId) {
		this.carouselId = carouselId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddUserId() {
		return addUserId;
	}

	public void setAddUserId(String addUserId) {
		this.addUserId = addUserId;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Carousel{" +
				"carouselId='" + carouselId + '\'' +
				", imagePath='" + imagePath + '\'' +
				", title='" + title + '\'' +
				", addUserId='" + addUserId + '\'' +
				", addDate='" + addDate + '\'' +
				", sort='" + sort + '\'' +
				'}';
	}
}
