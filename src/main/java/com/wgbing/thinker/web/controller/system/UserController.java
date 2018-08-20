package com.wgbing.thinker.web.controller.system;

import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.common.R;
import com.wgbing.thinker.service.system.UserService;
import com.wgbing.thinker.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * TODO: 用户管理控制层
 * @author wgbing
 * @date 2018/8/20 14:40
 */
@Controller
@RequestMapping("/sys/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * TODO: 系统管理 | 用户管理页面
     * @author wgbing
     * @date 2018/8/20 14:40
     */
    @GetMapping("/index")
    public String roleIndex(){
        return "/base/user/list";
    }

    /**
     * TODO: 用户列表
     * @author wgbing
     * @date 2018/8/20 14:40
     * @param page 分页参数封装
     */
    @ResponseBody
    @GetMapping("/list")
    public Page<UserVo> list(Page<UserVo> page){
        return userService.listUser(page);
    }

    /**
     * TODO: 新增用户
     * @author wgbing
     * @date 2018/8/20 15:11
     */
    @GetMapping("add")
    public String add(){
        return "/base/user/add";
    }

}
