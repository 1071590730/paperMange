package com.hqyj.www.pojo;

import java.util.Date;

public class Paper {
    private Integer paperId;

    private Integer userId;

    private String paperurl;

    private String departreview;

    private String schoolreview;

    private Date uploadtime;

    private String paperpro;

    public Integer getPaperId() {
        return paperId;
    }

    public void setPaperId(Integer paperId) {
        this.paperId = paperId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPaperurl() {
        return paperurl;
    }

    public void setPaperurl(String paperurl) {
        this.paperurl = paperurl;
    }

    public String getDepartreview() {
        return departreview;
    }

    public void setDepartreview(String departreview) {
        this.departreview = departreview;
    }

    public String getSchoolreview() {
        return schoolreview;
    }

    public void setSchoolreview(String schoolreview) {
        this.schoolreview = schoolreview;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getPaperpro() {
        return paperpro;
    }

    public void setPaperpro(String paperpro) {
        this.paperpro = paperpro;
    }
}