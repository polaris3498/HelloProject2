package com.goodee.gdlibrary.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.gdlibrary.service.ManageService;

@Controller
public class LibraryController {

	@Autowired
	private ManageService manageService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/admin/manage")
	public String manage() {
		return "manage/manageMain";
	}
	
	@GetMapping("/admin/memberManage")
	public String member() {
		return "manage/memberManage";
	}
	
	@GetMapping("/admin/reservationManage")
	public String reservationManage() {
		return "manage/reservationManage";
	}
	
	@GetMapping("/admin/bookManage")
	public String bookManage() {
		return "manage/bookManage";
	}
	
	@GetMapping("/admin/boardsManage")
	public String boardsManage() {
		return "manage/boardsManage";
	}
	
	@GetMapping("/admin/memberCheckRemove")
	public void memberCheckRemove(HttpServletRequest request, HttpServletResponse response) {
		manageService.removeMember(request, response);
	}
	
	
}
