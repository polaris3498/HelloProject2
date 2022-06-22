package com.goodee.gdlibrary.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManageMapper {
	
	public int deleteMember(List<String> list);
}
