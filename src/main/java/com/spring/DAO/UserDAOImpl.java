package com.spring.DAO;

import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    DataSource dataSource;



    @Override
    public String validateUser(String email, String password) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String SQL = "SELECT name from User " +
                "WHERE email = ? AND password = ?";

        try {
            return jdbcTemplate.queryForObject(SQL,new Object [] {email,password},String.class);

        }
        catch (Exception e){
            return "";
        }

    }

    @Override
    public String createUser(User user) {
        return null;
    }
}
