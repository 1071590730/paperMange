package com.hqyj.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*
@author:Lenovo
@program:paperManage
@date:2020-08-02 14:10:37
@description:
*/
@Controller
@RequestMapping("login")
public class LoginController {

    @RequestMapping("checkLogin.ajax")
    @ResponseBody
    public String checkLogin(){
        return "success";
    }

}
