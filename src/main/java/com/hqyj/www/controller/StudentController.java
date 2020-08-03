package com.hqyj.www.controller;

import com.hqyj.www.pojo.Paper;
import com.hqyj.www.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/*
@author:Lenovo
@program:paperManage
@date:2020-08-02 16:51:55
@description:
*/
@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    private PaperService paperService;

    @RequestMapping("queryPaperById.ajax")
    @ResponseBody
    public Paper queryPaperById(String name, ModelMap map){
        Paper paper = paperService.queryPaperByUserName(name);
        System.err.println("--------queryPaperById-------name="+name);
        System.err.println("--------queryPaperById-------paper="+paper);
//        map.put("data",hashMap);
        return paper;
    }
}
