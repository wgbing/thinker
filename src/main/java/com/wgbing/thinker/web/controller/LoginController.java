package com.wgbing.thinker.web.controller;

import com.wgbing.thinker.common.R;
import com.wgbing.thinker.service.LoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * TODO: 系统登录控制层
 * @author wgbing
 * @date 2018/7/10 15:35
 */
@Controller
public class LoginController {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private LoginService loginService;

    @RequestMapping("/login")
    public String login() {
        return "/login";
    }

    @RequestMapping("/face/login")
    public String faceLogin() {
        return "/face_login";
    }

    @GetMapping("/register")
    public String register() {
        return "/register";
    }

    @GetMapping("/face/register")
    public String faceRegister() {
        return "/face_register";
    }

    @ResponseBody
    @PostMapping("/face/register/save")
    public R faceRegisterSave(String userPhoto){
        if(StringUtils.isEmpty(userPhoto)){
            return R.failure("参数校验失败，请重试！");
        }
        return loginService.faceRegisterSave(userPhoto);
    }

    @GetMapping("/index")
    public String index() {
        return "/index";
    }

    @GetMapping("/main")
    public String welcome() {
        return "/main";
    }

}
