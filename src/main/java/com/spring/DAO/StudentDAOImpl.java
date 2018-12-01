package com.spring.DAO;

import com.spring.model.Student;
import com.spring.model.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class StudentDAOImpl implements StudentDAO {

    @Autowired
    DataSource dataSource;


    @Override
    public int addStudent(Student student) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String SQL = "INSERT INTO student (NameinFull, PreferredName, Age, Address, Contact, Field) VALUES " +
                     "(?,?,?,?,?,?)";

        try {

            return jdbcTemplate.update(SQL,student.getNameinfull(),
                                    student.getPreferredname(),
                                    student.getAge(),
                                    student.getAddress(),
                                    student.getContact(),
                                    student.getField());
        }
        catch (Exception e){

            return 0;
        }


    }

    @Override
    public List getStuList() {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String SQL = "SELECT * FROM STUDENT";

        try {
            List stuList = jdbcTemplate.queryForList(SQL);
            return stuList;
        }
        catch (Exception e){
            return null;
        }


    }

    @Override
    public Student getStudentBySID(int sid) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        Student student ;

        String SQL ="SELECT * FROM STUDENT WHERE SID = ?";

        try {
           student =  jdbcTemplate.queryForObject(SQL,new Object[]{sid},new StudentMapper());
        }
        catch (Exception e){
            student = jdbcTemplate.queryForObject(SQL,new Object[]{sid},new StudentMapper());
        }
        return student;
    }

    @Override
    public int updateStudent(Student student) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        int status = 0;

        String SQL = "UPDATE STUDENT " +
                "SET NameinFull = ?, " +
                "PreferredName = ?, " +
                "Age = ?, " +
                "Address = ?, " +
                "Contact = ?, " +
                "Field = ? " +
                "WHERE SID = ?";

        try {

         status =   jdbcTemplate.update(SQL,new Object[]{student.getNameinfull(),
                    student.getPreferredname(),
                    student.getAge(),
                    student.getAddress(),
                    student.getContact(),
                    student.getField(),
                    student.getSid()});
        }
        catch (Exception e){
            status = 0;
        }



        return status;
    }

    @Override
    public int deleteStudent(int sid) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        int status;

        String SQL = "DELETE FROM STUDENT " +
                "WHERE SID = ?";

        try {

            status = jdbcTemplate.update(SQL,sid);
        }
        catch (Exception e){
            status = 0;
        }
        return status;
    }
}
