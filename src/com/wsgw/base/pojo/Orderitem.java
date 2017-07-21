package com.wsgw.base.pojo;

public class Orderitem {
    private Integer id;

    private Integer productid;

    private String productname;
    
    private Float productMarketprice;
    
    public Float getProductMarketprice() {
		return productMarketprice;
	}

	public void setProductMarketprice(Float productMarketprice) {
		this.productMarketprice = productMarketprice;
	}

	private Float productprice;

    private Integer amount;

    private String orderid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public Float getProductprice() {
        return productprice;
    }

    public void setProductprice(Float productprice) {
        this.productprice = productprice;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }
}