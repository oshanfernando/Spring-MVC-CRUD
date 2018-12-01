package com.spring.service;

import com.spring.model.Student;

import java.util.List;

public interface StudentService {
    public int addStudent(Student student);
    public List getStuList();
    public Student getStudentBySID(int sid);
    public int updateStudent(Student student);
    public int deleteStudent (int sid);
}
