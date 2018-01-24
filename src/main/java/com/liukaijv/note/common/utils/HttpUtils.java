package com.liukaijv.note.common.utils;

import javax.servlet.http.HttpServletRequest;

public class HttpUtils {

    public static final String X_REQUESTED_WIDTH = "X-Requested-With";
    public static final String XML_HTTP_REQUEST = "XMLHttpRequest";

    public static boolean isAjax(HttpServletRequest request) {
        String xhrHeader = request.getHeader(X_REQUESTED_WIDTH);
        return (xhrHeader != null && XML_HTTP_REQUEST.equalsIgnoreCase(xhrHeader));
    }

}
