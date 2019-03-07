package com.wgbing.thinker.service;

import cn.hutool.core.util.StrUtil;
import com.wgbing.thinker.common.R;
import com.wgbing.thinker.dao.AppInfoDao;
import com.wgbing.thinker.domain.AppInfo;
import com.wgbing.thinker.utils.AuthUtil;
import com.wgbing.thinker.utils.GsonUtils;
import com.wgbing.thinker.utils.HttpUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;


/**
 * TODO: 注册业务逻辑处理层
 * @author wgbing
 * @date 2018/8/20 14:41
 */
@Service
@Transactional
public class LoginService {

    @Autowired
    private AppInfoDao appInfoDao;

    public R faceRegisterSave(String userPhoto) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", StrUtil.subAfter(userPhoto,",",false));
            map.put("image_type", "BASE64");
            map.put("group_id", "group_repeat");
            map.put("user_id", "user1");
            map.put("user_info", "abc");
            map.put("liveness_control", "NORMAL");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            AppInfo appInfo = appInfoDao.findByConfigKeyAndDeletedFalse("RLSB");
            if(appInfo == null){
                return R.failure("未注册人脸识别服务，请检查！");
            }
            String accessToken = AuthUtil.getAuth(appInfo.getApiKey(),appInfo.getSecretKey());

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            JSONObject jsonObject = new JSONObject(result);
            BigInteger error_code = jsonObject.getBigInteger("error_code");
            if(!StringUtils.isEmpty(error_code)){
                return R.failure(jsonObject.getString("error_msg"));
            }
            return R.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.failure("注册失败，请刷新重试！");
    }

}
