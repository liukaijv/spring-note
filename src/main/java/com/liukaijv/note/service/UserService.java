package com.liukaijv.note.service;

import com.liukaijv.note.model.User;

public interface UserService {

    public User findByUsername(String username);
}
