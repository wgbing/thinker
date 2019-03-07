package com.wgbing.thinker.dao;

import com.wgbing.thinker.domain.AppInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * TODO: 第三方应用信息DAO层
 * @author wgbing
 * @date 2019/3/5 10:01 PM
 */
public interface AppInfoDao extends JpaRepository<AppInfo, Long> {
    AppInfo findByConfigKeyAndDeletedFalse(String configKey);
}
