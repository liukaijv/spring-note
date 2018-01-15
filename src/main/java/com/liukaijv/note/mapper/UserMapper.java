package com.liukaijv.note.mapper;

import com.liukaijv.note.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    public User selectAll();
}
