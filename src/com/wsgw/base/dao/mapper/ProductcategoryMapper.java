package com.wsgw.base.dao.mapper;

import com.wsgw.base.pojo.Productcategory;
import com.wsgw.base.pojo.ProductcategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductcategoryMapper {
    int countByExample(ProductcategoryExample example);

    int deleteByExample(ProductcategoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Productcategory record);

    int insertSelective(Productcategory record);

    List<Productcategory> selectByExample(ProductcategoryExample example);

    Productcategory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Productcategory record, @Param("example") ProductcategoryExample example);

    int updateByExample(@Param("record") Productcategory record, @Param("example") ProductcategoryExample example);

    int updateByPrimaryKeySelective(Productcategory record);

    int updateByPrimaryKey(Productcategory record);
}