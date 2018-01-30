package com.liukaijv.note.service;

import com.liukaijv.note.model.User;

public interface UserService {

    public User create(User user);

    public void update();

    public void delete(User user);

    public User findByUsername(String username);
}
