package com.wgbing.thinker.web.controller.system;

import com.wgbing.thinker.service.system.OrganizationService;
import com.wgbing.thinker.vo.OrganizationVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    /**
     * TODO: 系统管理 | 组织管理页面
     * @author wgbing
     * @date 2018/7/26 下午11:23
     */
    @GetMapping("/index")
    public String orgIndex(){
        return "/base/org/list";
    }

    /**
     * TODO: 组织列表
     * @author wgbing
     * @date 2018/7/26 下午11:24
     */
    @ResponseBody
    @GetMapping("/list")
    public List<OrganizationVo> list(){
        return organizationService.listOrg();
    }

    /**
     * TODO: 新增机构
     * @author wgbing
     * @date 2018/7/27 16:01
     */
    @GetMapping("/add")
    public String add(){
        return "/base/org/add";
    }

    /**
     * TODO: 编辑机构
     * @author wgbing
     * @date 2018/7/27 16:01
     */
    @GetMapping("/edit")
    public String edit(@RequestParam(value = "orgId",required = true) Long orgId){
        OrganizationVo orgVo = organizationService.findOne(orgId);
        return "/base/org/edit";
    }

}
