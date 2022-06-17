package com.goodee.gdlibrary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Test {

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
	
	
}
