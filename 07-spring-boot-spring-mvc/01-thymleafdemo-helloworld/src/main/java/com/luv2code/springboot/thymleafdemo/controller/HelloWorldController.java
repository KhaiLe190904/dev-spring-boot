package com.luv2code.springboot.thymleafdemo.controller;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloWorldController {

    // need a controller method to show initial HTML form
    @RequestMapping("/showForm")
    public String showForm(){
        return "helloworld-form";
    }
    // need a controller mothod to process the HTML form
    @RequestMapping("processForm")
    public String processForm(){
        return "helloworld";
    }

    // need a controller method to read form data and
    // add data to the model
    @RequestMapping("processFormVersionTwo")
    public String letShouDude(HttpServletRequest request, Model model){

        // read the request parameter from HTML form
        String theName = request.getParameter("studentName");
        // convert the data too all caps
        theName = theName.toUpperCase();
        // create the message
        String result = "Yo! " + theName;
        //  add message to the model
        model.addAttribute("message", result);

        return "helloworld";
    }
    @RequestMapping("processFormVersionThree")
    public String processFormVersionThree(@RequestParam("studentName") String theName
                                        , Model model){

        // convert the data too all caps
        theName = theName.toUpperCase();
        // create the message
        String result = "Hey my fr from V3! " + theName;
        //  add message to the model
        model.addAttribute("message", result);

        return "helloworld";
    }
}
