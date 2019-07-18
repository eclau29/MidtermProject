package com.skilldistillery.cofish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxCrud.ModifyView;

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
	
	@RequestMapping(path = "searchResults.do")
	public String searchResults(Model model) {
		return "cofish/searchResults";
	}
	
	@RequestMapping(path = "searchPage.do")
	public String searchPage(Model model) {
		return "cofish/searchPage";
	}
	
	@RequestMapping(path = "locationDetails.do")
	public String locationDetails(Model model) {
		return "cofish/locationsDetails";
	}
	
	@RequestMapping(path = "addReport.do")
	public String addReport(Model model) {
		return "cofish/addUpdate";
	}
	
	@RequestMapping(path = "updateReport.do")
	public String updateReport(Model model) {
		return "cofish/addUpdate";
	}
	
}
