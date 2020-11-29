package com.project.dbms.service;

import com.project.dbms.model.User;

public interface UserService {
    void save(User user);

    User findUser(String username);
}
