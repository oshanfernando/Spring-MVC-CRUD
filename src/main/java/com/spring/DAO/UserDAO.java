package com.spring.DAO;


import com.spring.model.User;

public interface UserDAO {

    public String validateUser(String email, String password);
    public String createUser(User user);
}
