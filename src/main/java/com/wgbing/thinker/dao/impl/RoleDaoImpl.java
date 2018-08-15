package com.wgbing.thinker.dao.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.domain.Role;
import com.wgbing.thinker.vo.RoleVo;

import javax.persistence.Query;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * TODO: 用户角色数据操作层
 * @author wgbing
 * @date 2018/7/12 下午11:15
 */
public class RoleDaoImpl extends BaseDao {

    @SuppressWarnings("unchecked")
    public Page<RoleVo> listRole(Page<RoleVo> page){
        // 分页参数
        String  sortName  = page.getSortName();                   // 排序字段
        String  sortOrder = page.getSortOrder();                  // 升序还是降序
        Integer pageNo    = page.getPageNumber();                 // 页数，从1开始计数
        Integer pageSize  = page.getPageSize();                   // 每页记录条数
        Integer firstRes  = (pageNo - 1) * pageSize;              // 查询记录开始位置

        // 初始化变量
        StringBuffer condSql = new StringBuffer();                  // 查询条件SQL变量
        StringBuffer countSql = new StringBuffer();                 // 总记录查询SQL变量
        StringBuffer dataSql = new StringBuffer();                  // 分页数据查询SQL变量
        Integer count = 0;                                          // 总条数
        List<RoleVo> data = new ArrayList<>();                      // 分页数据集

        /* 1.组装查询条件 */
        Map<String, String> paramMap = page.getParamMap();

        if(paramMap != null){
            if (!StrUtil.isEmpty(paramMap.get("name"))) {
                condSql.append(" and r.name like '%").append(paramMap.get("name")).append("%' ");
            }
            if(!StrUtil.isEmpty(paramMap.get("beginTime"))) {
                String beginTime = paramMap.get("beginTime") + " 00:00:00";
                condSql.append(" and r.updateTime >= '").append(beginTime).append("' ");
            }
            if(!StrUtil.isEmpty(paramMap.get("endTime"))) {
                String endTime = paramMap.get("endTime") + " 23:59:59";
                condSql.append(" and r.updateTime <= '").append(endTime).append("' ");
            }
        }

        /* 2.总记录查询 */
        countSql.append("select count(r) from Role r where r.deleted = false ").append(condSql);

        Query countQuery = getEntityManager().createQuery(countSql.toString());
        List<Long> countList = countQuery.getResultList();
        if (countList != null && !countList.isEmpty()) {
            count = countList.get(0).intValue();
        }

        if(count>0){

            dataSql.append("select r from Role r where r.deleted = false ").append(condSql);

            // 排序SQL
            if (StrUtil.isNotEmpty(sortName) && StrUtil.isNotEmpty(sortOrder)) {
                dataSql.append(MessageFormat.format(" order by r.{0} {1} ", sortName, sortOrder));
            }

            // 参数预处理、查询
            Query dataQuery = getEntityManager().createQuery(dataSql.toString());
            dataQuery.setFirstResult(firstRes);
            dataQuery.setMaxResults(pageSize);
            List<Role> resultList = dataQuery.getResultList();

            // 后置处理
            if (resultList != null && resultList.size()>0) {
                for (Role role : resultList) {
                    RoleVo roleVo = new RoleVo();
                    roleVo.setId(role.getId());
                    roleVo.setName(role.getName());
                    roleVo.setDescription(role.getDescription());
                    roleVo.setUpdateTime(DateUtil.formatDate(role.getUpdateTime()));
                    data.add(roleVo);
                }
            }
        }

        //生成返回结果
        page.setRows(data);
        page.setTotal(count);

        return page;
    }
}
