package com.exercise_19.controller;

package ra.academy.controller;

import com.exercise_19.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class HomeController {
    @Autowired
    private MailService mailService;

    @RequestMapping({"/",""})
    public String home(){
       mailService.sendMail("duc@gmail.com","duc01@gmail.com","test mail","có cái nịt");
        return "index";

    }
}
