package com.wgbing.thinker.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * TODO: 第三方应用信息实体
 * @author wgbing
 * @date 2019/3/5 21:22
 */
@Entity
@Table(name = "out_app_info")
public class AppInfo {
    /* ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /* 名称 */
    @Column(name = "name")
    private String name;
    /* AppId */
    @Column(name = "app_id")
    private String appId;
    /* API Key  */
    @Column(name = "api_key")
    private String apiKey;
    /* Secret Key */
    @Column(name = "secret_key")
    private String secretKey;
    /* 应用分类 1=百度AI应用 2=腾讯AI应用*/
    @Column(name = "type")
    private Integer type;
    /* 配置KEY项 */
    @Column(name = "config_key")
    private String configKey;
    /* 是否删除 true=已删除；false=未删除 */
    @Column(name = "deleted")
    private Boolean deleted;
    /* 创建时间 */
    @Column(name = "create_time")
    private Date createTime;
    /* 更新时间 */
    @Column(name = "update_time")
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
