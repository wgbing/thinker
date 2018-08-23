package com.wgbing.thinker.service.system;

import com.wgbing.thinker.dao.PermissionDao;
import com.wgbing.thinker.domain.Permission;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO: 用户权限业务逻辑处理层
 * @author wgbing
 * @date 2018/7/25 16:26
 */
@Service
@Transactional
public class PermissionService {
    private static final Logger log = LoggerFactory.getLogger(PermissionService.class);

    @Autowired
    private PermissionDao permissionDao;

    public List<Map<String,Object>> createPermissionTree() {
        List<Map<String,Object>> resultList = new ArrayList<>();
        List<Permission> permissions = permissionDao.findAll();
        if (permissions != null && !permissions.isEmpty()){
            for (Permission permission:permissions){
                Map<String,Object> map = new HashMap<>();
                map.put("id",permission.getId());
                map.put("name",permission.getName());
                if(null == permission.getParentId()){
                    map.put("parentId",0L);
                }else {
                    map.put("parentId",permission.getParentId());
                }
                map.put("open",true);
                resultList.add(map);
            }
        }
        Map<String,Object> rootMap = new HashMap<>();
        rootMap.put("id",0L);
        rootMap.put("name","权限管理");
        rootMap.put("parentId",-1L);
        rootMap.put("open",true);
        resultList.add(rootMap);
        return resultList;
    }
}
