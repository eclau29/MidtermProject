//package com.skilldistillery.cofish.controllers;
//
//import java.util.List;
//
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.Errors;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.skilldistillery.cofish.data.FishDAO;
//import com.skilldistillery.cofish.entities.CaughtFish;
//import com.skilldistillery.cofish.entities.FishType;
//
//@Controller
//public class FishController {
//
//	@Autowired
//	private FishDAO dao;
//	
//	@RequestMapping(path = "/")
//	public String index() {
//		return "WEB-INF/index.jsp";
//	}
//	
////	@RequestMapping(path="createFishType.do", method= RequestMethod.POST)
////	public String createFishType(@Valid FishType fishType, Errors errors, Model model) {
////		FishType newFishType;
////		if(errors.getErrorCount() != 0) {
////			return "WEB-INF/tool/generalError.jsp";
////		}
////		newFishType = dao.create(fishType);
////		model.addAttribute("fishType", newFishType);
////		return null;//FIXME
////	}
////	
////	@RequestMapping(path="updateFishType.do", method= RequestMethod.POST)
////	public String updateFishType(int id, Model model, FishType fishType) {
////		FishType updateFishType = dao.update(id, fishType);
////		updateFishType = dao.findByIdFishType(id);
////		model.addAttribute("fishType", updateFishType);
////		return null;//FIXME
////	}
//	
//	@RequestMapping(path = "showAll.do", method= RequestMethod.GET)
//	public String showAllFishType(Model model) {
//		List<FishType> allFishType = dao.findAll();
//		model.addAttribute("fishType", allFishType);
//		
//		return "cofish/showAllFishType";
//	}
//	
//	
//	@RequestMapping(path="searchByKeywordFishType.do", method= RequestMethod.GET)//FIXME
//	public String showResultsByKeyword(String fishType, Model model) {
//		List<FishType> ftList = dao.searchByKewordFT(fishType);
//		model.addAttribute("fishType", ftList);
//		System.out.println(ftList);
//		return "cofish/searchResults"; 
//	}
//	
////	@RequestMapping(path="createCaughtFish.do", method= RequestMethod.POST)
////	public String createCaughtFish(@Valid CaughtFish caughtFish, Errors errors, Model model) {
////		CaughtFish newCaughtFish;
////		if(errors.getErrorCount() != 0) {
////			return "WEB-INF/tool/error.jsp";
////		}
////		newCaughtFish = dao.create(caughtFish);
////		model.addAttribute("caughtFish", newCaughtFish);
////		return "cofish/"; //FIXME
////	}
////	
////	@RequestMapping(path="updateCaughtFish.do", method= RequestMethod.POST)
////	public String updateCaughtFish(int id, Model model, CaughtFish caughtFish) {
////		CaughtFish updateCaughtFish = dao.update(id, caughtFish);
////		updateCaughtFish = dao.findByIdCaughtFish(id);
////		model.addAttribute("caughtFish", updateCaughtFish);
////		return null;//FIXME
////	}
//	
//	
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
