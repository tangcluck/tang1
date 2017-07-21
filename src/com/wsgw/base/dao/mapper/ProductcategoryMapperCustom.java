package com.wsgw.base.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wsgw.base.pojo.vo.ProductcategoryCustom;


public interface ProductcategoryMapperCustom {
	public List<ProductcategoryCustom> findCategory(@Param(value="pid")Integer pid);
	public Integer maxId();
	public List<ProductcategoryCustom> findAllCategory();
}