package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/11/10.
 * decription : 捐赠物品
 */
public class Donation {

    private String donationId;
    private String userId;
    private String donationName;
    private String category;
    private int amount;
    private String location;
    private String description;
    private Date donationDate;
    private int status;
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDonationId() {
        return donationId;
    }

    public void setDonationId(String donationId) {
        this.donationId = donationId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDonationName() {
        return donationName;
    }

    public void setDonationName(String donationName) {
        this.donationName = donationName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDonationDate() {
        return donationDate;
    }

    public void setDonationDate(Date donationDate) {
        this.donationDate = donationDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Donation{" +
                "donationId='" + donationId + '\'' +
                ", userId='" + userId + '\'' +
                ", donationName='" + donationName + '\'' +
                ", category='" + category + '\'' +
                ", amount=" + amount +
                ", location='" + location + '\'' +
                ", description='" + description + '\'' +
                ", donationDate='" + donationDate + '\'' +
                ", status=" + status +
                '}';
    }
}
