package com.skilldistillery.cofish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {

	@RequestMapping(path= {"/", "logout.do"})
	public String logoutIndex(Model model, HttpSession session){
		session.removeAttribute("user");
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
	
	@RequestMapping(path = "getSearchResults.do")
	public String searchResults(Model model) {
		return "cofish/searchResults";
	}
	
	
	
	@RequestMapping(path = "getLocationDetails.do")
	public String locationDetails(Model model) {
		return "cofish/locationsDetails";
	}
	
	@RequestMapping(path = "getRegistration.do")
	public String registration(Model model) {
		return "cofish/userSplash";
	}
	
	
	
}
