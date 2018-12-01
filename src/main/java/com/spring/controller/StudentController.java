package com.spring.controller;


import com.spring.model.Student;
import com.spring.model.User;
import com.spring.service.StudentService;
import netscape.javascript.JSObject;
import org.codehaus.jackson.map.util.JSONPObject;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StudentController {

    @Autowired
    StudentService StudentService;

    @RequestMapping(value = "/studentmanagement",method = RequestMethod.GET)
    public String getStudentManagementPage(Model model,HttpSession session){
        if(session.getAttribute("isLoggedIn")=="true"){
            model.addAttribute("student",new Student());
            model.addAttribute("studentList",this.StudentService.getStuList());
            return "studentmanagement";
        }
        else {
            model.addAttribute("user",new User());
            model.addAttribute("notLoggedIn","Please Log in to continue !");
            return "login";
        }

    }


    @RequestMapping(value = "/addstudent",method = RequestMethod.POST)
    public @ResponseBody String addStudent(@RequestBody Student student, HttpServletRequest request){

        JSONObject jsonobject = new JSONObject();

        try {


            int status = StudentService.addStudent(student);

            if(status == 1){
                jsonobject.put("code","SUCCESS");

            }
            else{
                jsonobject.put("code","ERROR");

            }

        }
        catch (Exception e){
            jsonobject.put("code","ERROR -"+e.getMessage());

        }
        return jsonobject.toString();

    }

    @RequestMapping(value = "/edit/{sid}", method = RequestMethod.GET)
    public String editStudent(@PathVariable("sid") int sid, Model model){
        model.addAttribute("isedit",true);
        model.addAttribute("student",this.StudentService.getStudentBySID(sid));
        model.addAttribute("studentList",this.StudentService.getStuList());

        return "studentmanagement";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public @ResponseBody String updateStudent(@RequestBody Student student){

        JSONObject jsonObject = new JSONObject();
        int status = this.StudentService.updateStudent(student);


        if(status == 1){
            jsonObject.put("code","SUCCESS");

        }
        else{
            jsonObject.put("code","ERROR");

        }


        return jsonObject.toString();

    }

    @RequestMapping(value = "/delete/{sid}", method = RequestMethod.GET)
    public String delete(@PathVariable("sid") int sid, Model model){


        int status  = this.StudentService.deleteStudent(sid);


        if (status == 1 ){
            model.addAttribute("student",new Student());
            model.addAttribute("studentList",this.StudentService.getStuList());
            model.addAttribute("deleteMsg","Successfully Deleted Student with ID "+sid);
        }
        else {
            model.addAttribute("student",new Student());
            model.addAttribute("studentList",this.StudentService.getStuList());
        }


        return "studentmanagement";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(Model model, HttpSession session){
        model.addAttribute("user", new User());
        session.setAttribute("isLoggedIn","false");
        model.addAttribute("isLoggedIn",session.getAttribute("isLoggedIn"));

        return "login";

    }
}
