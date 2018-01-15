package com.liukaijv.note.common.base;

import java.io.Serializable;

public class Result implements Serializable {

    public static final int SUCCESS = 1;

    public static final int FAILURE = -1;

    private boolean success = false;

    private String msg = "";

    private Object data = null;

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public boolean getSuccess() {
        return this.success;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Object getData() {
        return this.data;
    }

}
