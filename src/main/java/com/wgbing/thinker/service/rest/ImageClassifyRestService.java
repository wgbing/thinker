package com.wgbing.thinker.service.rest;

import com.wgbing.thinker.common.R;
import com.wgbing.thinker.dao.AppInfoDao;
import com.wgbing.thinker.domain.AppInfo;
import com.wgbing.thinker.utils.AuthUtil;
import com.wgbing.thinker.utils.HttpUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URLEncoder;

/**
 * TODO: 图像识别服务
 * @author wgbing
 * @date 2019/3/5 10:14 PM
 */
@Service
@Transactional
public class ImageClassifyRestService {

    @Autowired
    private AppInfoDao appInfoDao;

    /**
     * TODO: 植物识别
     * @author wgbing
     * @date 2019/3/5 10:14 PM
     * @return
     * @throws 
     */
    public R plantRecognition(String imgData) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/plant";
        try {

            String imgParam = URLEncoder.encode(imgData, "UTF-8");

            String param = "image=" + imgParam+"&baike_num=1";

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            AppInfo appInfo = appInfoDao.findByConfigKeyAndDeletedFalse("TXSB");
            if(appInfo == null){
                return R.failure("未注册图像识别服务，请检查！");
            }
            String accessToken = AuthUtil.getAuth(appInfo.getApiKey(),appInfo.getSecretKey());
            String result = HttpUtil.post(url, accessToken, param);
//            System.out.println(result);
//            JSONObject jsonObject = new JSONObject(result);
            R r = new R();
            r.setSuccess(true);
            r.setData(result);
            return r;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.failure();
    }
}
