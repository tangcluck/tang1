package com.wsgw.base.pojo;


public class Productinfo {
    private Integer id;

    private String name;

    private String createtime;

    private Float baseprice;

    private Float marketprice;

    private Float sellprice;

    private String sexrequest;

    private Boolean commend;

    private Integer clickcount;

    private Integer sellcount;

    private Integer categoryid;

    private Integer uploadfile;

    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Float getBaseprice() {
        return baseprice;
    }

    public void setBaseprice(Float baseprice) {
        this.baseprice = baseprice;
    }

    public Float getMarketprice() {
        return marketprice;
    }

    public void setMarketprice(Float marketprice) {
        this.marketprice = marketprice;
    }

    public Float getSellprice() {
        return sellprice;
    }

    public void setSellprice(Float sellprice) {
        this.sellprice = sellprice;
    }

    public String getSexrequest() {
        return sexrequest;
    }

    public void setSexrequest(String sexrequest) {
        this.sexrequest = sexrequest == null ? null : sexrequest.trim();
    }

    public Boolean getCommend() {
        return commend;
    }

    public void setCommend(Boolean commend) {
        this.commend = commend;
    }

    public Integer getClickcount() {
        return clickcount;
    }

    public void setClickcount(Integer clickcount) {
        this.clickcount = clickcount;
    }

    public Integer getSellcount() {
        return sellcount;
    }

    public void setSellcount(Integer sellcount) {
        this.sellcount = sellcount;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public Integer getUploadfile() {
        return uploadfile;
    }

    public void setUploadfile(Integer uploadfile) {
        this.uploadfile = uploadfile;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}