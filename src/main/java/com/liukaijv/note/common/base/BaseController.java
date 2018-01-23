package com.liukaijv.note.common.base;

public abstract class BaseController {

    public Object error(String msg) {
        Result result = new Result();
        result.setMsg(msg);
        return result;
    }

    public Object success() {
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }

    public Object success(String msg) {
        Result result = new Result();
        result.setSuccess(true);
        result.setMsg(msg);
        return result;
    }

    public Object success(Object data) {
        Result result = new Result();
        result.setSuccess(true);
        result.setData(data);
        return result;
    }

    /**
     * @param url
     * @return
     */
    protected String redirect(String url) {
        return new StringBuilder("redirect:").append(url).toString();
    }
}
