package com.wsgw.base.pojo.vo;

import com.wsgw.base.pojo.Productcategory;

public class ProductcategoryCustom extends Productcategory{
	private int child;
	private String parent;
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	
	
}