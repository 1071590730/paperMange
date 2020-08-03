package com.hqyj.www.dao;

import com.hqyj.www.pojo.Paper;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;

public interface PaperMapper {
    int deleteByPrimaryKey(Integer paperId);

    int insert(Paper record);

    int insertSelective(Paper record);

    Paper selectByPrimaryKey(Integer paperId);

    int updateByPrimaryKeySelective(Paper record);

    int updateByPrimaryKeyWithBLOBs(Paper record);

    int updateByPrimaryKey(Paper record);

    //自己写的方法
    @Select("select paper.* from paper left join `user` on paper.user_id=`user`.user_id WHERE `user`.`name`=#{name}")
    Paper queryPaperByUserName(String name);

}