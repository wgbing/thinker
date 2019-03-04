package com.wgbing.thinker.web.controller.rest;

import com.wgbing.thinker.common.R;
import com.wgbing.thinker.service.rest.ImageClassifyRestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest")
public class ImageClassifyRestController {

    @Autowired
    private ImageClassifyRestService imageClassifyRestService;


    @PostMapping("/image/flower")
    public R flowerRecognition(String imageData, String openId, String nickName){
        return imageClassifyRestService.flowerRecognition(imageData);
    }


}
