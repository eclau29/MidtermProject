package com.skilldistillery.cofish.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.cofish.data.LocationDAO;
import com.skilldistillery.cofish.entities.Report;

@Controller
public class LocationController {
	
	@Autowired
	private LocationDAO dao;
	
//	@RequestMapping(path = "/")
//	public String index() {
//		return "cofish/index";
//	}
	
	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
	public String createReport(Model model, Errors errors, Report report) {
		if (errors.getErrorCount() != 0) {
			return "cofish/generalError";
		}
		Report newReport = dao.createReport(report);
		model.addAttribute("report", newReport);
		return "locationDetails";

	}

	@RequestMapping(path = "updateReport.do", method = RequestMethod.POST)
	public String updateReport(@RequestParam("reportId") int id, Model model, Errors errors, Report report) {
		if (errors.getErrorCount() != 0) {
			return "cofish/generalError";
		}

		Report newReport = dao.updateReport(id, report);
		model.addAttribute("report", newReport);
		return "locationDetails";

	}
	
//	@RequestMapping(path = "showAllReportsForLocation.do", method= RequestMethod.GET)
//	public String showAllReportsForLocation(Model model) {
//		try {
//			for (Report report : iterable) {
//				
//			}
//		}
	}

























