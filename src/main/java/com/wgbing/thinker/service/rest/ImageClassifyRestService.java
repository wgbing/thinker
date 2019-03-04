package com.wgbing.thinker.service.rest;

import com.wgbing.thinker.common.R;
import com.wgbing.thinker.utils.AuthUtil;
import com.wgbing.thinker.utils.Base64Util;
import com.wgbing.thinker.utils.HttpUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URLEncoder;

@Service
@Transactional
public class ImageClassifyRestService {


    public R plantRecognition(String imgData) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/plant";
        try {
            String imgParam = URLEncoder.encode(imgData, "UTF-8");

            String param = "image=" + imgParam;

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthUtil.getAuth();

            String result = HttpUtil.post(url, accessToken, param);
            System.out.println(result);
            return R.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.failure();
    }
}
