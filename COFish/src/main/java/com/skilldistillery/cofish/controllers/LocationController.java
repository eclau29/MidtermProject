
package com.skilldistillery.cofish.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.cofish.data.FishDAO;
import com.skilldistillery.cofish.data.LocationDAO;
import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO dao;
	private FishDAO daoFish;
	
	@RequestMapping(path = "findLocationById.do", method = RequestMethod.GET)
	public String findLocationById (int locationId, Model model) {
		Location foundLocation = dao.findLocationById(locationId);
		model.addAttribute("location", foundLocation);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
	public String createReport(Model model, Report report, @RequestParam("caughtFish")CaughtFish ...caughtFish) {
		System.err.println("report details:" + report);
		Report newReport = dao.createReport(report);
		if(caughtFish.length != 0) {
			for (CaughtFish caughtFish2 : caughtFish) {
				if(caughtFish2.getReport().isActive()) {
					CaughtFish fish = daoFish.create(caughtFish2);
					newReport.addCaughtFish(fish);
				}
			}
		}	
		model.addAttribute("report", newReport);
		
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "updateReport.do", method = RequestMethod.POST)
	public String updateReport(@RequestParam("reportId") int id, Model model, Report report) {

		Report newReport = dao.updateReport(id, report);
		model.addAttribute("report", newReport);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "showAllLocations.do", method= RequestMethod.GET)
	public String showAllLocations(Model model) {
		List<Location> showAllLocations = dao.showAllLocations();
		model.addAttribute("allLocations", showAllLocations);
		return "cofish/searchResults";
	}
	
	@RequestMapping(path = "showAllReportsForLocation.do", method= RequestMethod.GET)
	public String showAllReportsForLocation(Model model, @RequestParam("locationId") int id) {
		
		List<Report> allReports = dao.findAllReports(id);
		model.addAttribute("allReports", allReports);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path= "removeReport.do", method= RequestMethod.POST)
	public String removeReport(Model model, @RequestParam("reportId") int id, int locationId) {
			Report reportToRemove = dao.searchReportById(id);
			dao.removeReportFromLocation(reportToRemove, locationId);
			
			return "cofish/locationsDetails";
	}
	
	@RequestMapping(path= "showLocationsByName.do", method= RequestMethod.GET)
	public String listLocationsByName(Model model, @RequestParam("locationName") String name) {
		List <Location> locationByName = dao.locationsByName(name);
		model.addAttribute("location", locationByName);
		return "cofish/locationsDetails";
	}
	
	@RequestMapping(path= "showLocationsByWaterBody.do", method= RequestMethod.GET)
	public String listLocationsByWaterBody(Model model, @RequestParam("waterBody") String name) {
		List <Location> locationByWaterBody = dao.locationsByWaterBody(name);
		model.addAttribute("location", locationByWaterBody);
		return "cofish/locationsDetails";
	}
	
	@RequestMapping(path= "showLocationsByRegion.do", method= RequestMethod.GET)
	public String listLocationsByRegion(Model model, @RequestParam("regionName") String region) {
		List <Location> locationByRegion = dao.locationsByRegion(region);
		model.addAttribute("location", locationByRegion);
		return "cofish/locationsDetails";
	}
	
	@RequestMapping(path="showLocationsByAccess.do", method= RequestMethod.GET)
	public String listLocationsByAccess(Model model, @RequestParam("access")String access) {
		List<Location> locationsByAccess = dao.locationsByAccessibility(access);
		model.addAttribute("access", locationsByAccess);
		return "cofish/locationsDetails";
	}
	
	@RequestMapping(path="showLocationsByFishName", method= RequestMethod.GET)
	public String listLocationsByFish(Model model, @RequestParam("fishName")String fish) {
		List<Location> locationsByFishName = dao.locationByFishName(fish);
		model.addAttribute("location", locationsByFishName);
		return "cofish/locationsDetails";
	}
}

