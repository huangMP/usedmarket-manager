package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户信息实体类
 */
public class UserInfo {

    /**
     * 用户信息表主键
     */
    private String userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 手机
     */
    private String phone;

    /**
     * 1：男；0：女
     */
    private int sex;

    /**
     * 附件Id
     */
    private String attachmentId;

    /**
     * 生日
     */
    private String yearOfBirth;

    /**
     * 身份证号码
     */
    private String IDNum;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 注册时间
     */
    private Date registrationDate;

    /**
     * 所属学校
     */
    private String school;

    /**
     * 收获地址

     */
    private String shippingAddress;
    /**
     * 星座
     */
    private String constellation;
    /**
     * 血型
     */
    private String bloodType;

    /**
     * 个性签名
     */
    private String signature;

    /**
     * 角色Id
     * @return
     */
    private String roleId;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(String yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }
    public String getIDNum() {
        return IDNum;
    }

    public void setIDNum(String IDNum) {
        this.IDNum = IDNum;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }


    public String getConstellation() {
        return constellation;
    }

    public void setConstellation(String constellation) {
        this.constellation = constellation;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", sex=" + sex +
                ", attachmentId='" + attachmentId + '\'' +
                ", yearOfBirth='" + yearOfBirth + '\'' +
                ", IDNum='" + IDNum + '\'' +
                ", realName='" + realName + '\'' +
                ", registrationDate=" + registrationDate +
                ", school='" + school + '\'' +
                ", shippingAddress='" + shippingAddress + '\'' +
                ", constellation='" + constellation + '\'' +
                ", bloodType='" + bloodType + '\'' +
                ", signature='" + signature + '\'' +
                ", roleId='" + roleId + '\'' +
                '}';
    }
}
