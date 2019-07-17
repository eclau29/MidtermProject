package com.skilldistillery.cofish.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxCrud.ModifyView;

@Controller
public class TestController {

	@RequestMapping(path= {"/", "home.do"})
	public String loginIndex(Model model){
		return "index";
	}
	
	@RequestMapping(path = "getUserSplash.do")
	public String userSplash(Model model) {
 		return "cofish/userSplash";
	}
	
	@RequestMapping(path = "getGuestSplash.do")
	public String guestSplash(Model model) {
		
		return "cofish/guestSplash";
	}
	
	@RequestMapping(path = "searchResults.do")
	public String searchResults(Model model) {
		return "cofish/searchResults";
	}
	
	@RequestMapping(path = "locationDetails.do")
	public String locationDetails(Model model) {
		return "cofish/locationDetails";
	}
	
}
