package com.maker.entity;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户角色实体类
 */
public class MakerRole {

    /**
     * 角色Id
     */
    private String roleId;
    /**
     * 角色名称
     */
    private String roleName;
    /**
     * 角色真实名称
     */
    private String roleRealName;
    /**
     * 状态
     */
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleRealName() {
        return roleRealName;
    }

    public void setRoleRealName(String roleRealName) {
        this.roleRealName = roleRealName;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleId='" + roleId + '\'' +
                ", roleName='" + roleName + '\'' +
                ", roleRealName='" + roleRealName + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
