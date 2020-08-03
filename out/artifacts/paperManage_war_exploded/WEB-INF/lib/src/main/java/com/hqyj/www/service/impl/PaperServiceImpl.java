package com.hqyj.www.service.impl;

import com.hqyj.www.dao.PaperMapper;
import com.hqyj.www.pojo.Paper;
import com.hqyj.www.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class PaperServiceImpl implements PaperService {
    @Autowired
    private PaperMapper mapper;

    @Override
    public Paper queryPaperByUserName(String name) {
        return mapper.queryPaperByUserName(name);
    }
}
