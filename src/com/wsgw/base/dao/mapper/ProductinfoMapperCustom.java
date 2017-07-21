package com.wsgw.base.dao.mapper;

import com.wsgw.base.pojo.vo.ProductinfoCustom;
import com.wsgw.base.utils.PageModel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ProductinfoMapperCustom {
	public List<ProductinfoCustom> findByCreateTime(@Param(value="pageModel")PageModel pageModel);
	public List<ProductinfoCustom> findBySellCount(@Param(value="pageModel")PageModel pageModel);
	public List<ProductinfoCustom> findCommend(@Param(value="pageModel")PageModel pageModel);
	public List<ProductinfoCustom> findEnjoyProduct(@Param(value="pageModel")PageModel pageModel);
	public List<ProductinfoCustom> findByName(@Param(value="name")String name);
	public ProductinfoCustom findById(Integer id);
	public List<ProductinfoCustom> productList();
	public int max();
	public Integer count();
}