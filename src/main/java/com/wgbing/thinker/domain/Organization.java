package com.wgbing.thinker.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TODO: 组织机构实体
 * @author wgbing
 * @date 2018/7/10 16:40
 */
@Entity
@Table(name = "sys_organization")
public class Organization {
    /* ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /* 父级组织 */
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private Organization parent;
    /* 组织名称 */
    @Column(name = "org_name")
    private String orgName;
    /* 组织简称 */
    @Column(name = "short_name")
    private String shortName;
    /* 备注 */
    @Column(name = "remark")
    private String remark;
    /* 机构类型 */
    @Column(name = "type")
    private Integer type;
    /* 子级组织列表 */
    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "parent",cascade={CascadeType.MERGE},targetEntity = Organization.class)
    @OrderBy("id asc")
    private Set<Organization> children;
    /* 排序序号 */
    @Column(name = "sort_no")
    private Integer sortNo;
    /* 是否启用 true=正常；false=禁用 */
    @Column(name = "enable")
    private Boolean enable;
    /* 是否已删除：true=未删除；false=已删除 */
    @Column(name = "deleted")
    private Boolean deleted;
    /* 创建时间 */
    @Column(name = "create_time")
    private Date createTime;
    /* 更新时间 */
    @Column(name = "update_time")
    private Date updateTime;

    /* 角色对应的管理员列表 */
    @JsonIgnore
    @ManyToMany(mappedBy = "orgs")
    private Set<Role> roles = new HashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Organization getParent() {
        return parent;
    }

    public void setParent(Organization parent) {
        this.parent = parent;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Set<Organization> getChildren() {
        return children;
    }

    public void setChildren(Set<Organization> children) {
        this.children = children;
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
