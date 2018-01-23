package com.liukaijv.note.controller;

import com.liukaijv.note.common.base.BaseController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class AuthController extends BaseController {

    @PostMapping("/login")
    @ResponseBody
    public Object login() {

        String errorMsg = "";

        return this.error(errorMsg);
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Object logout() {

        return this.success();
    }

}
