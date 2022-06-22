package com.goodee.gdlibrary.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

public interface ManageService {
	
	
	public void removeMember(HttpServletRequest request, HttpServletResponse response);
	
	
	
}
