
package com.skilldistillery.cofish.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.cofish.data.LocationDAO;
import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO dao;
	
	@RequestMapping(path = "getReportDetails.do", method = RequestMethod.GET)
	public void populateReportDatails(int reportId, Model model) {
		model.addAttribute("reportDetails", dao.searchReportById(reportId));
	}
	
	@RequestMapping(path = "findLocationById.do", method = RequestMethod.GET)
	public String findLocationById (int locationId, Model model) {
		Location foundLocation = dao.findLocationById(locationId);
		model.addAttribute("location", foundLocation);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
	public String createReport(Model model, Report report) {
		
		Report newReport = dao.createReport(report);
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
	
	@RequestMapping(path="getSearchResults.do", method = RequestMethod.GET)
	public String directSearchByCategory(String searchCategory, String keyword, Model model) {
		System.err.println("**********serach results method***********" + searchCategory);
		
		if (searchCategory.equals("location")){
//			System.err.println("******** IN SEARCH method for location********");
			List<Location> searchLocationList = listLocationsByWaterBody(keyword);
//			System.err.println("keyword; " + keyword);
			for (Location location : searchLocationList) {
				System.err.println(location);
			}
			model.addAttribute("resultsList",searchLocationList);
			return "cofish/searchResults";
		}
		if (searchCategory.equals("fish")) {
			List<Location> searchFishList = listLocationsByFish(keyword);
			model.addAttribute("resultsList", searchFishList);
			return "cofish/searchResults";
		}
		else {
			List<Location> searchAccessList = listLocationsByAccess(keyword);
			System.err.println("********** IN SEARCH ACCESS ELSE BLOCK **********");
			System.err.println(keyword);
			for (Location location : searchAccessList) {
				System.err.println(location);
			}
			model.addAttribute("resultsList", searchAccessList);
			return "cofish/searchResults";
		}
	}
	
//	@RequestMapping(path= "showLocationsByWaterBody.do", method= RequestMethod.GET)
	public List<Location> listLocationsByWaterBody(String name) {
		List <Location> locationByWaterBody = dao.locationsByWaterBody(name);
		return locationByWaterBody;
	}
	
	
//	@RequestMapping(path="showLocationsByAccess.do", method= RequestMethod.GET)
	public List<Location> listLocationsByAccess(String access) {
		List<Location> locationsByAccess = dao.locationsByAccessibility(access);
		return locationsByAccess;
	}
	
//	@RequestMapping(path="showLocationsByFishName", method= RequestMethod.GET)
	public List<Location> listLocationsByFish(String fish) {
		List<Location> locationsByFishName = dao.locationByFishName(fish);
		return locationsByFishName;
	}
	
	@RequestMapping(path= "showLocationsByName.do", method= RequestMethod.GET)
	public String listLocationsByName(Model model, @RequestParam("locationName") String name) {
		List <Location> locationByName = dao.locationsByName(name);
		model.addAttribute("location", locationByName);
		return "cofish/locationsDetails";
	}
	@RequestMapping(path= "showLocationsByRegion.do", method= RequestMethod.GET)
	public String listLocationsByRegion(Model model, @RequestParam("regionName") String region) {
		List <Location> locationByRegion = dao.locationsByRegion(region);
		model.addAttribute("location", locationByRegion);
		return "cofish/locationsDetails";
	}
}

