package com.wgbing.thinker.common;

import java.util.List;
import java.util.Map;

public class DataTableOutput<T> {

    private Integer total;
    /* DataTable中需要显示的数据 */
    private List<T> rows;
    /* 可选，定义一个错误来描述服务器出了问题后的提示 */
    private String error;
    private Map<String, Object> addInfo;

}
