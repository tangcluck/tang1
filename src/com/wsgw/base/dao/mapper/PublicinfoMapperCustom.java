package com.wsgw.base.dao.mapper;

import java.util.List;

import com.wsgw.base.pojo.Publicinfo;

public interface PublicinfoMapperCustom {
	public int findNoticeId();
	public List<Publicinfo> findAllNotice();
}