package com.liukaijv.note.common.utils;


import org.springframework.web.util.UriUtils;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

public class URLUtils extends UriUtils {


    public static String encodeURL(String source, Charset charset) {

        try {
            return URLUtils.encode(source, charset.name());
        } catch (UnsupportedEncodingException e) {

            throw new RuntimeException(e.getMessage(), e);

        }
    }

}
