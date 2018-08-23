package com.wgbing.thinker.web.controller.system;

import com.wgbing.thinker.service.system.PermissionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * TODO: 用户权限控制层
 * @author wgbing
 * @date 2018/8/23 17:17
 */
@Controller
@RequestMapping("/sys/permission")
public class PermissionController {
    private static final Logger log = LoggerFactory.getLogger(PermissionController.class);

    @Autowired
    private PermissionService permissionService;


    /**
     * TODO: 方法描述
     * @author wgbing
     * @date 2018/8/23 17:20
     */
    @ResponseBody
    @GetMapping("/tree")
    public List<Map<String,Object>> createPermissionTree(){
        return permissionService.createPermissionTree();
    }

}
