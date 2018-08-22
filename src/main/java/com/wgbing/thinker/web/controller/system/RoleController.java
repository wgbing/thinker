package com.wgbing.thinker.web.controller.system;

import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.common.R;
import com.wgbing.thinker.service.system.RoleService;
import com.wgbing.thinker.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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

    /**
     * TODO: 保存/更新角色
     * @author wgbing
     * @date 2018/8/18 10:15
     * @param roleVo 角色信息
     */
    @ResponseBody
    @PostMapping("/save")
    public R save(RoleVo roleVo){
        return roleService.saveRole(roleVo);
    }

    /**
     * TODO: 编辑角色
     * @author wgbing
     * @date 2018/8/17 13:41
     */
    @GetMapping("/edit")
    public String edit(@RequestParam(value = "roleId",required = true) Long roleId,
                       Map<String,Object> map){
        RoleVo roleVo = roleService.findOne(roleId);
        map.put("role",roleVo);
        return "/base/role/edit";
    }

    /**
     * TODO: 删除角色
     * @author wgbing
     * @date 2018/8/22 17:12
     * @param roleIds 角色Id集合，用逗号分开
     */
    @ResponseBody
    @GetMapping("/delete")
    public R delete(@RequestParam(value = "roleIds",required = true) String roleIds){
        return roleService.deleteRole(roleIds);
    }

    @ResponseBody
    @GetMapping("/select")
    public R listRoleByOrgId(@RequestParam(value = "orgId",required = true) Long orgId){
        return roleService.listRoleByOrgId(orgId);
    }

}
