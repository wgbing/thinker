package com.wgbing.thinker.web.controller.system;

import com.wgbing.thinker.service.system.OrganizationService;
import com.wgbing.thinker.vo.OrganizationVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * TODO: 用户组织机构控制层
 * @author wgbing
 * @date 2018/7/20 18:49
 */
@Controller
@RequestMapping("/sys/org")
public class OrganizationController {
    private static final Logger log = LoggerFactory.getLogger(OrganizationController.class);

    @Autowired
    private OrganizationService organizationService;

    @GetMapping("/index")
    public String orgIndex(){
        return "/base/org/list";
    }

    @ResponseBody
    @GetMapping("/list")
    public List<OrganizationVo> list(){
        return organizationService.list();
    }
}
