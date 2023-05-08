package com.example.backofficewbdesign.util;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.Base64;

public class ImageEncoder {

    public static String encodeImage (CommonsMultipartFile file)throws Exception {

        byte[] bytes = file.getBytes();
        String encodeImage = "data:image/"+ImageEncoder.getFileExtension(file)+";base64,"+ Base64.getEncoder().encodeToString(bytes);
        return encodeImage;

    }
    private static  String getFileExtension(CommonsMultipartFile file ) throws Exception{
        String name = file.getOriginalFilename();
        int last =name.lastIndexOf('.');
        if(last == -1){
            return "";
        }
        String val = name.substring(last+1);
        System.out.println(val);
        return val;
    }
}
