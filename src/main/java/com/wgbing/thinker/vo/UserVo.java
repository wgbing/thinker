package com.wgbing.thinker.vo;

public class UserVo {
    /* ID */
    private Long id;
    /* 登录名 */
    private String loginName;
    /* 姓名 */
    private String realName;
    /* 密码 */
    private String password;
    /* 账户类型：1=管理员；2=普通用户*/
    private Integer type;
    /* 性别 0=女；1=男 */
    private Integer sex;
    /* 手机号 */
    private String mobile;
    /* 邮箱 */
    private String email;
    /* 备注 */
    private String remark;
    /* 排序序号 */
    private Integer sortNo;
    /* 是否启用 true=启用；false=禁用 */
    private Boolean enable;
    /* 是否删除 true=已删除；false=未删除 */
    private Boolean deleted;
    /* 上次登陆时间 */
    private String lastLoginTime;
    /* 上次登陆所用ip */
    private String lastLoginIp;
    /* 创建时间 */
    private String createTime;
    /* 更新时间 */
    private String updateTime;
    /* 所属组织Id */
    private Long orgId;
    /* 所属组织名称 */
    private String orgName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
}
