package com.spring.service;

import com.spring.DAO.StudentDAO;
import com.spring.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentDAO studentDAO;

    @Override
    public int addStudent(Student student) {
        return studentDAO.addStudent(student);
    }

    @Override
    public List<Student> getStuList() {
        return studentDAO.getStuList();
    }

    @Override
    public Student getStudentBySID(int sid) {
        return studentDAO.getStudentBySID(sid);
    }

    @Override
    public int updateStudent(Student student) {
        return studentDAO.updateStudent(student);
    }

    @Override
    public int deleteStudent(int sid) {
        return studentDAO.deleteStudent(sid);
    }
}
