package com.maker.entity;

import java.util.Date;

/**
 * Description：商品类
 * Created by Peivxuan on 2016/10/23.
 */
public class Commodity {

	/**
	 * 商品id
	 */
	private String commodityId;

	/**
	 * 用户id
	 */
	private String userId;

	/**
	 * 商店id
	 */
	private String storeId;

	/**
	 * 商品名称
	 */
	private String commodityName;

	/**
	 * 分类
	 */
	private String category;

	/**
	 * 价格
	 */
	private Double price;

	/**
	 * 数量
	 */
	private Integer amount;

	/**
	 * 描述
	 */
	private String description;

	/**
	 * 当前定位
	 */
	private String location;

	/**
	 * 收藏人数
	 */
	private Integer preferNum;

	/**
	 * 上架时间
	 */
	private Date launchDate;

	/**
	 * 销售量
	 */
	private Integer salesVolume;

	/**
	 * 销售状态：0.在售；1.交易中；2.已售出
	 */
	private Integer status;

	public Commodity() {
	}

	public Commodity(String commodityId, String userId, String storeId, String commodityName, String category, double price, Integer amount, String description, String location, Integer preferNum, Date launchDate, Integer salesVolume, Integer status) {
		this.commodityId = commodityId;
		this.userId = userId;
		this.storeId = storeId;
		this.commodityName = commodityName;
		this.category = category;
		this.price = price;
		this.amount = amount;
		this.description = description;
		this.location = location;
		this.preferNum = preferNum;
		this.launchDate = launchDate;
		this.salesVolume = salesVolume;
		this.status = status;
	}

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getPreferNum() {
		return preferNum;
	}

	public void setPreferNum(Integer preferNum) {
		this.preferNum = preferNum;
	}

	public Date getLaunchDate() {
		return launchDate;
	}

	public void setLaunchDate(Date launchDate) {
		this.launchDate = launchDate;
	}

	public Integer getSalesVolume() {
		return salesVolume;
	}

	public void setSalesVolume(Integer salesVolume) {
		this.salesVolume = salesVolume;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Commodity{" +
				"commodityId='" + commodityId + '\'' +
				", userId='" + userId + '\'' +
				", storeId='" + storeId + '\'' +
				", commodityName='" + commodityName + '\'' +
				", category='" + category + '\'' +
				", price=" + price +
				", amount=" + amount +
				", description='" + description + '\'' +
				", location='" + location + '\'' +
				", preferNum=" + preferNum +
				", launchDate=" + launchDate +
				", salesVolume=" + salesVolume +
				", status=" + status +
				'}';
	}
}
