package com.wsgw.base.dao.mapper;

import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.PublicinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PublicinfoMapper {
    int countByExample(PublicinfoExample example);

    int deleteByExample(PublicinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Publicinfo record);

    int insertSelective(Publicinfo record);

    List<Publicinfo> selectByExampleWithBLOBs(PublicinfoExample example);

    List<Publicinfo> selectByExample(PublicinfoExample example);

    Publicinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Publicinfo record, @Param("example") PublicinfoExample example);

    int updateByExampleWithBLOBs(@Param("record") Publicinfo record, @Param("example") PublicinfoExample example);

    int updateByExample(@Param("record") Publicinfo record, @Param("example") PublicinfoExample example);

    int updateByPrimaryKeySelective(Publicinfo record);

    int updateByPrimaryKeyWithBLOBs(Publicinfo record);

    int updateByPrimaryKey(Publicinfo record);
}