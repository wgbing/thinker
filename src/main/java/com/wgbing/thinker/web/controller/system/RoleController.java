package com.wgbing.thinker.web.controller.system;

import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.service.system.RoleService;
import com.wgbing.thinker.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * TODO: 用户角色管理控制层
 * @author wgbing
 * @date 2018/8/3 23:20
 */
@Controller
@RequestMapping("/sys/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * TODO: 系统管理 | 角色管理页面
     * @author wgbing
     * @date 2018/7/26 下午11:23
     */
    @GetMapping("/index")
    public String roleIndex(){
        return "/base/role/list";
    }

    /**
     * TODO: 角色列表
     * @author wgbing
     * @date 2018/8/17 13:39
     * @param page 分页参数封装
     */
    @ResponseBody
    @GetMapping("/list")
    public Page<RoleVo> list(Page<RoleVo> page){
        return roleService.listRole(page);
    }

    /**
     * TODO: 新增角色
     * @author wgbing
     * @date 2018/8/17 13:41
     */
    @GetMapping("/add")
    public String add(){
        return "/base/role/add";
    }

    /**
     * TODO: 树形机构
     * @author wgbing
     * @date 2018/8/17 16:22
     */
    @GetMapping("/orgTree")
    public String orgTree(){
        return "/base/role/orgTree";
    }
}
