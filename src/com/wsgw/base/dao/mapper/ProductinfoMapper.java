package com.wsgw.base.dao.mapper;

import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.ProductinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductinfoMapper {
    int countByExample(ProductinfoExample example);

    int deleteByExample(ProductinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Productinfo record);

    int insertSelective(Productinfo record);

    List<Productinfo> selectByExampleWithBLOBs(ProductinfoExample example);

    List<Productinfo> selectByExample(ProductinfoExample example);

    Productinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Productinfo record, @Param("example") ProductinfoExample example);

    int updateByExampleWithBLOBs(@Param("record") Productinfo record, @Param("example") ProductinfoExample example);

    int updateByExample(@Param("record") Productinfo record, @Param("example") ProductinfoExample example);

    int updateByPrimaryKeySelective(Productinfo record);

    int updateByPrimaryKeyWithBLOBs(Productinfo record);

    int updateByPrimaryKey(Productinfo record);
}