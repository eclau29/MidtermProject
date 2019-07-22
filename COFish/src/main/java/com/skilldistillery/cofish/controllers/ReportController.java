package com.skilldistillery.cofish.controllers;

import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.cofish.data.ReportDAO;
import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.Report;

@Controller
public class ReportController {

	@Autowired
	private ReportDAO dao;
//
////	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
////	public String createReport(Model model, Errors errors, Report report) {
////		if (errors.getErrorCount() != 0) {
////			return "WEB/tool/generalError.jsp";
////		}
////		Report newReport = dao.createReport(report);
////		model.addAttribute("report", newReport);
////		return "locationDetails";
////
////	}
////
////	@RequestMapping(path = "updateReport.do", method = RequestMethod.POST)
////	public String updateReport(@RequestParam("reportId") int id, Model model, Errors errors, Report report) {
////		if (errors.getErrorCount() != 0) {
////			return "WEB/tool/generalError.jsp";
////		}
////
////		Report newReport = dao.updateReport(report, id);
////		model.addAttribute("report", newReport);
////		return "locationDetails";
////
////	}

	// ==============
	@RequestMapping(path = "updateCaughtFish.do", method = RequestMethod.POST)
	public String updateCaughtFish(@RequestParam("caughtFishId") int id, Model model,
			CaughtFish fishCaught) {
		try {
			CaughtFish fish = dao.findByIdCaughtFish(id);
			dao.update(id, fish);
			Report report = dao.findReportById(fish.getReport().getId());	
			model.addAttribute("report", report);
			return "cofish/searchResult";
		} catch (Exception e) {
			model.addAttribute("report", id);
			return "cofish/searchResult";
		}
	}
	
	@RequestMapping(path = "createCaughtFish.do", method = RequestMethod.POST)
	public String addCaughtFish(@RequestParam("reportId") int id, Model model, CaughtFish ...caughtFish) {
		if(caughtFish.length != 0) {
			for (CaughtFish caughtFish2 : caughtFish) {
				if(caughtFish2.getReport().isActive()) {
					CaughtFish fish = dao.create(caughtFish2);
					Report newReport = dao.findReportById(id);
					newReport.addCaughtFish(fish);
					model.addAttribute("report", newReport);
				}
			}
			
		}		
		return "cofish/searchResult";
	}
	
	@RequestMapping(path = "DirectUpdateCaughtFish.do", method = RequestMethod.GET)
	public String directCaughtFish(@RequestParam("reportId") int id, Model model) {
		List <CaughtFish> fishCaught = dao.findCaughtFishByReportId(id);
		model.addAttribute("caughtFish", fishCaught);
		return "updateCaughtFish";
		
	}
	
	@RequestMapping(path="deleteReport.do", method = RequestMethod.POST)
	public String deleteReport(@RequestParam("reportId") int id) {
		System.err.println("***********REPORT ID COMING IN TO DELETE REPORT METHOD: " + id);
		dao.deleteReport(id);
		return "cofish/locationsDetails";
	}
	
}