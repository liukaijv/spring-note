package com.liukaijv.note.controller;

import com.liukaijv.note.common.base.BaseController;
import com.liukaijv.note.mapper.UserMapper;
import com.liukaijv.note.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/index")
    public String Hello() {
        User user = userMapper.selectAll();
        return "home";
    }
}
