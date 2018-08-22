package com.wgbing.thinker.service.system;

import cn.hutool.core.date.DateUtil;
import com.wgbing.thinker.common.Page;
import com.wgbing.thinker.common.R;
import com.wgbing.thinker.dao.OrganizationDao;
import com.wgbing.thinker.dao.RoleDao;
import com.wgbing.thinker.domain.Organization;
import com.wgbing.thinker.domain.Role;
import com.wgbing.thinker.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    @Autowired
    private OrganizationDao organizationDao;

    public Page<RoleVo> listRole(Page<RoleVo> page) {
        return roleDao.listRole(page);
    }

    public R saveRole(RoleVo roleVo) {
        if(null == roleVo){
            return R.failure("参数校验失败，请刷新页面重新提交！");
        }
        Role role = new Role();
        Date currDate = new Date();
        if(roleVo.getId() != null){
            role = roleDao.findById(roleVo.getId()).get();
            role.setUpdateTime(currDate);
        }else {
            role.setCreateTime(currDate);
            role.setUpdateTime(currDate);
            role.setDeleted(false);
        }
        role.setName(roleVo.getName());
        role.setDescription(roleVo.getDescription());
        role.setRemark(roleVo.getRemark());
        Organization org = organizationDao.findById(roleVo.getOrgId()).get();
        role.setOrganization(org);
        roleDao.save(role);

        return R.success();
    }

    public RoleVo findOne(Long roleId) {
        RoleVo roleVo = new RoleVo();
        Role role = roleDao.findById(roleId).get();
        roleVo.setId(role.getId());
        roleVo.setName(role.getName());
        roleVo.setDescription(role.getDescription());
        roleVo.setRemark(role.getRemark());
        roleVo.setOrgName(role.getOrganization().getOrgName());
        roleVo.setOrgId(role.getOrganization().getId());
        roleVo.setCreateTime(DateUtil.formatDate(role.getCreateTime()));
        roleVo.setUpdateTime(DateUtil.formatDate(role.getUpdateTime()));
        return roleVo;
    }

    public R deleteRole(String roleIds) {
        //todo:删除角色逻辑
        return R.success();
   }

    public R listRoleByOrgId(Long orgId) {
        List<RoleVo> roleVoList = new ArrayList<>();
        List<Role> roleList = roleDao.findAllByOrganization_Id(orgId);
        if(roleList != null && !roleList.isEmpty()){
            for(Role role:roleList){
                RoleVo roleVo = new RoleVo();
                roleVo.setId(role.getId());
                roleVo.setName(role.getName());
                roleVoList.add(roleVo);
            }
        }
        return R.success(roleVoList);
    }
}
