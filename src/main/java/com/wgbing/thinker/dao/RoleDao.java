package com.wgbing.thinker.dao;


import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.domain.Role;
import com.wgbing.thinker.vo.RoleVo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * TODO: 用户角色数据操作层
 * @author wgbing
 * @date 2018/7/12 下午11:20
 */
public interface RoleDao extends JpaRepository<Role, Long> {

    Page<RoleVo> listRole(Page<RoleVo> page);

    List<Role> findAllByOrganization_Id(Long orgId);
}
