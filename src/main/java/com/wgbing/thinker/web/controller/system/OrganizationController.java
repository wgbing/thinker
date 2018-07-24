package com.wgbing.thinker.web.controller.system;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO: 用户组织机构控制层
 * @author wgbing
 * @date 2018/7/20 18:49
 */
@Controller
@RequestMapping("/org")
public class OrganizationController {
    private static final Logger log = LoggerFactory.getLogger(OrganizationController.class);

    @GetMapping("/index")
    public String orgIndex(){
        return "/system/org/index";
    }

    @GetMapping("/list")
    public String list(){
        return null;
    }
}
