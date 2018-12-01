package com.spring.service;

import com.spring.DAO.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDAO userDAO;

    @Override
    public String validateUser(String username, String password) {
        return userDAO.validateUser(username,password);
    }
}
