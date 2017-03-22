package com.maker.service;

import com.maker.entity.Carousel;

import java.util.List;

/**
 * Description：轮播图Service
 * Created by Peivxuan on 2016/11/26.
 */
public interface CarouselService {

	/**
	 * 查找前五张轮播图
	 * @return 返回轮播图list
	 */
	List<Carousel> selectTop5();

	/**
	 * 插入一张轮播图
	 * @param carousel 要添加的轮播图
	 * @return 是否成功
	 */
	boolean insert(Carousel carousel);

	/**
	 * 通过轮播图id删除轮播图
	 * @param carouselId 轮播图id
	 * @return 是否成功
	 */
	boolean deleteByCarouselId(String carouselId);

	/**
	 * 通过轮播图id更新
	 * @param carousel 要更新的轮播图
	 * @return 是否成功
	 */
	boolean updateByCarouselId(Carousel carousel);

}
