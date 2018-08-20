package com.wgbing.thinker.service.system;

import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.dao.UserDao;
import com.wgbing.thinker.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * TODO: 用户管理业务逻辑处理层
 * @author wgbing
 * @date 2018/8/20 14:41
 */
@Service
@Transactional
public class UserService {

    @Autowired
    private UserDao userDao;

    public Page<UserVo> listUser(Page<UserVo> page) {
        return null;
    }
}
