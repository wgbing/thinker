package com.wgbing.thinker.dao;

import com.wgbing.thinker.domain.Organization;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * TODO: 用户组织数据操作层
 * @author wgbing
 * @date 2018/7/12 下午11:17
 */
public interface OrganizationDao extends JpaRepository<Organization, Long> {

}
