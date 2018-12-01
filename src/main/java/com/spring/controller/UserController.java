package com.spring.controller;

import com.spring.model.Student;
import com.spring.model.User;
import com.spring.service.StudentService;
import com.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    com.spring.service.StudentService StudentService;


    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String getLoginPage(Model model,HttpSession session){
        model.addAttribute("user", new User());

        if(session.getAttribute("isLoggedIn") == "true"){

            model.addAttribute("student",new Student());
            model.addAttribute("studentList",StudentService.getStuList());
            return "studentmanagement";
        }
        else{
            return "login";
        }

    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Model model, @ModelAttribute("user") User user, HttpSession session){



        if(user.getEmail() != "" && user.getPassword()!=""){
            String name =  userService.validateUser(user.getEmail(), user.getPassword());
            if (name != "") {


                model.addAttribute("student",new Student());
                model.addAttribute("studentList",StudentService.getStuList());
                session.setAttribute("isLoggedIn","true");

                return "studentmanagement";
            }
            else {
                model.addAttribute("msg","Incorrect Email or Password");
                return "login";
            }
        }
        else {
            model.addAttribute("msg","Both Fields are required");
            return "login";
        }

    }



}
