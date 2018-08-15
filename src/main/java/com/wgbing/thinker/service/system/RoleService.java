package com.wgbing.thinker.service.system;

import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.dao.RoleDao;
import com.wgbing.thinker.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * TODO: 用户角色业务逻辑处理层
 * @author wgbing
 * @date 2018/7/25 16:26
 */
@Service
@Transactional
public class RoleService {

    @Autowired
    private RoleDao roleDao;

    public Page<RoleVo> listRole(Page<RoleVo> page) {
        return roleDao.listRole(page);
    }
}
