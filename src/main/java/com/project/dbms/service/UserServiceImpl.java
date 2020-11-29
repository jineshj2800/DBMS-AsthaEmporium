package com.project.dbms.service;

import com.project.dbms.dao.Userdao;
import com.project.dbms.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private Userdao userdao;

    @Override
    public void save(User user) {
        userdao.save(user.getUsername(),user.getPassword(),user.getRole());
    }

    @Override
    public User findUser(String username) {
        return userdao.findUser(username);
    }
}