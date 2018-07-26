package com.wgbing.thinker.service.system;

import cn.hutool.core.date.DateUtil;
import com.wgbing.thinker.dao.OrganizationDao;
import com.wgbing.thinker.domain.Organization;
import com.wgbing.thinker.vo.OrganizationVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * TODO: 用户组织机构业务逻辑处理层
 * @author wgbing
 * @date 2018/7/25 16:26
 */
@Service
@Transactional
public class OrganizationService {
    private static final Logger log = LoggerFactory.getLogger(OrganizationService.class);

    @Autowired
    private OrganizationDao organizationDao;

    public List<OrganizationVo> listOrg() {
        List<OrganizationVo> orgVoList = new ArrayList<>();
        List<Organization> orgList = this.organizationDao.findAll();
        if(orgList != null && !orgList.isEmpty()){
            for(Organization org:orgList){
                OrganizationVo orgVo = new OrganizationVo();
                orgVoList.add(orgVo);
                orgVo.setId(org.getId());
                if(org.getParent() != null){
                    orgVo.setParentId(org.getParent().getId());
                }else {
                    orgVo.setParentId(null);
                }
                orgVo.setName(org.getName());
                orgVo.setShortName(org.getShortName());
                orgVo.setRemark(org.getRemark());
                orgVo.setType(org.getType());
                orgVo.setSortNo(org.getSortNo());
                orgVo.setEnable(org.getEnable());
                orgVo.setDeleted(org.getDeleted());
                orgVo.setCreateTime(DateUtil.formatDate(org.getCreateTime()));
                orgVo.setUpdateTime(DateUtil.formatDate(org.getUpdateTime()));
            }
        }
        return orgVoList;
    }

    public OrganizationVo findOne(Long orgId) {
        OrganizationVo orgVo = new OrganizationVo();
        if(orgId != null){
            Organization org = this.organizationDao.findById(orgId).get();
            orgVo.setId(org.getId());
            if(org.getParent() != null){
                orgVo.setParentId(org.getParent().getId());
            }else {
                orgVo.setParentId(null);
            }
            orgVo.setName(org.getName());
            orgVo.setShortName(org.getShortName());
            orgVo.setRemark(org.getRemark());
            orgVo.setType(org.getType());
            orgVo.setSortNo(org.getSortNo());
            orgVo.setEnable(org.getEnable());
            orgVo.setDeleted(org.getDeleted());
            orgVo.setCreateTime(DateUtil.formatDate(org.getCreateTime()));
            orgVo.setUpdateTime(DateUtil.formatDate(org.getUpdateTime()));
        }

        return orgVo;
    }
}
