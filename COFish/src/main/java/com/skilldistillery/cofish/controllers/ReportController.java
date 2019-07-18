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

//	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
//	public String createReport(Model model, Errors errors, Report report) {
//		if (errors.getErrorCount() != 0) {
//			return "WEB/tool/generalError.jsp";
//		}
//		Report newReport = dao.createReport(report);
//		model.addAttribute("report", newReport);
//		return "locationDetails";
//
//	}
//
//	@RequestMapping(path = "updateReport.do", method = RequestMethod.POST)
//	public String updateReport(@RequestParam("reportId") int id, Model model, Errors errors, Report report) {
//		if (errors.getErrorCount() != 0) {
//			return "WEB/tool/generalError.jsp";
//		}
//
//		Report newReport = dao.updateReport(report, id);
//		model.addAttribute("report", newReport);
//		return "locationDetails";
//
//	}

	// ==============
	@RequestMapping(path = "updateCaughtFish.do", method = RequestMethod.POST)
	public String updateCaughtFish(@RequestParam("reportId") int id, Model model,
			CaughtFish fishCaught) {
		try {
			CaughtFish fish = dao.findCaughtFishByReportId(id);
			dao.update(id, fish);
			
			model.addAttribute("caughtFish", fish);
			return "cofish/searchResult";
		} catch (Exception e) {
			model.addAttribute("reportId", id);
			return "cofish/searchResult";
		}
	}
	@RequestMapping(path = "createCaughtFish.do", method = RequestMethod.POST)
	public String addCaughtFish(@RequestParam("reportId") int id, CaughtFish caughtFish, Model model) {
		if(caughtFish.getReport().isActive()) {
			CaughtFish fish = dao.create(caughtFish);
			Report newReport = dao.findReportById(id);
			newReport.addCaughtFish(fish);
			model.addAttribute("caughtFish", fish);
		}
		
		return "cofish/searchResult";
	}

}
