package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public  final class StudentMapper implements RowMapper<Student> {
    @Override
    public Student mapRow(ResultSet resultSet, int i) throws SQLException {

        Student student = new Student();

        student.setSid(resultSet.getInt("SID"));
        student.setNameinfull(resultSet.getString("NameinFull"));
        student.setPreferredname(resultSet.getString("PreferredName"));
        student.setAddress(resultSet.getString("Address"));
        student.setContact(resultSet.getString("Contact"));
        student.setAge(resultSet.getInt("Age"));
        student.setField(resultSet.getInt("Field"));

        return student;
    }
}
