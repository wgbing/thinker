package com.wgbing.thinker.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DataTableInput {

    private static final Logger LOGGER = LoggerFactory.getLogger(DataTableInput.class);

    /* 页编号 : 第几页 */
    protected int pageNo = 1;
    /* 页大小 : 每页的数量 */
    protected int pageSize = 10;
    /* 排序字段 */
    private String sort;
    /* 排序方式 asc，desc */
    private String sortOrder;



}
