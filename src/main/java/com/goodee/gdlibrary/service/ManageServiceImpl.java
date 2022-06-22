package com.goodee.gdlibrary.service;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.gdlibrary.mapper.ManageMapper;

@Service
public class ManageServiceImpl implements ManageService {
    
	@Autowired
	private ManageMapper manageMapper;
	
	@Override
	public void removeMember(HttpServletRequest request, HttpServletResponse response) {
		String[] check = request.getParameterValues("check");
		List<String> list = Arrays.asList(check);
		manageMapper.deleteMember(list);
	}
	
	
	
}
