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

    @ResponseBody
    @GetMapping("/list")
    public Page<RoleVo> list(Page<RoleVo> page){
        return roleService.listRole(page);
    }
}
