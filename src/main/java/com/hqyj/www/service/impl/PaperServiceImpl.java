package com.hqyj.www.service.impl;

import com.hqyj.www.dao.PaperMapper;
import com.hqyj.www.pojo.Paper;
import com.hqyj.www.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaperServiceImpl implements PaperService {
    @Autowired
    private PaperMapper mapper;

    @Override
    public Paper queryPaperById(int id) {
        return mapper.selectByPrimaryKey(id);
    }
}
