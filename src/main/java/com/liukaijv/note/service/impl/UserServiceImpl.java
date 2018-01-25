package com.liukaijv.note.service.impl;

import com.liukaijv.note.model.User;
import com.liukaijv.note.service.UserService;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    public User findByUsername(String username) {
        User user = new User();
        return user;
    }
}
