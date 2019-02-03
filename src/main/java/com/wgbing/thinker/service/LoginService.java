package com.wgbing.thinker.service;

import com.wgbing.thinker.common.R;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * TODO: 注册业务逻辑处理层
 * @author wgbing
 * @date 2018/8/20 14:41
 */
@Service
@Transactional
public class LoginService {


    public R faceRegisterSave(String userPhoto) {
        return R.success();
    }
}
