package com.skilldistillery.cofish.controllers;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.cofish.data.FishDAO;
import com.skilldistillery.cofish.entities.FishType;

@Controller
public class FishController {

	@Autowired
	private FishDAO dao;
	
	
	
	@RequestMapping(path = "showAll.do", method= RequestMethod.GET)
	public String showAllFishType(Model model) {
		List<FishType> allFishType = dao.findAll();
		model.addAttribute("fishType", allFishType);
		
		return "showAllFishType";
	}
	
	@RequestMapping(path="searchByKeywordFishType.do", method= RequestMethod.GET)//FIXME
	public String showResultsByKeyword(String fishType, Model model) {
		List<FishType> ftList = dao.searchByKewordFT(fishType);
		model.addAttribute("fishType", ftList);
		System.out.println(ftList);
		return "searchResults"; 
	}
}


