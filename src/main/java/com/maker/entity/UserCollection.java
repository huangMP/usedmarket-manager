package com.maker.entity;

/**
 * Description：收藏表
 * Created by Peivxuan on 2016/11/16.
 */
public class UserCollection {

	/**
	 * 收藏表主键
	 */
	private String collectionId;

	/**
	 * 用户id
	 */
	private String userId;

	/**
	 * 商品id
	 */
	private String commodityId;

	public String getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(String collectionId) {
		this.collectionId = collectionId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	@Override
	public String toString() {
		return "UserCollection{" +
				"collectionId='" + collectionId + '\'' +
				", userId='" + userId + '\'' +
				", commodityId='" + commodityId + '\'' +
				'}';
	}
}
