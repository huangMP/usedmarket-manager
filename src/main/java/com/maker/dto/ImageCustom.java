package com.maker.dto;

import java.util.List;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2016/11/3.
 */
public class ImageCustom {
	/**
	 * 商品id
	 */
	private String commodityId;

	/**
	 * 商品图片
	 */
	private List<String> images;

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "ImageCustom{" +
				"commodityId='" + commodityId + '\'' +
				", images=" + images +
				'}';
	}

}
