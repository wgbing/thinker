package com.wgbing.thinker.common;

import java.util.List;
import java.util.Map;

/**
 * TODO: 分页参数及查询结果封装
 * @author wgbing
 * @date 2018/8/15 18:29
 */
public class Page<T> {
    /* 页编号 : 第几页 */
    private Integer pageNumber;
    /* 页大小 : 每页的数量 */
    private Integer pageSize;
    /* 排序字段 */
    private String sortName;
    /* 排序方式 asc，desc */
    private String sortOrder;
    /* 总条数 */
    private Integer total;
    /* DataTable中需要显示的数据 */
    private List<T> rows;
    /* 查询条件 */
    private Map<String, String> searchMap;

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public Map<String, String> getSearchMap() {
        return searchMap;
    }

    public void setSearchMap(Map<String, String> searchMap) {
        this.searchMap = searchMap;
    }
}
