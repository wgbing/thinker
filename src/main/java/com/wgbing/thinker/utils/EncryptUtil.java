package com.wgbing.thinker.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * TODO: 对数据进行加密操作
 * @author wgbing
 * @date 2018/7/12 下午11:36
 */
public class EncryptUtil {

    private static PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);

    /**
     * TODO: 获取加密实体
     * @author wgbing
     * @date 2018/7/12 下午11:37
     * @return
     * @throws
     */
    public static PasswordEncoder getPasswordEncoder() {
        return passwordEncoder;
    }

}
