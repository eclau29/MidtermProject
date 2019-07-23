
package com.skilldistillery.cofish.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.cofish.data.FishDAO;
import com.skilldistillery.cofish.data.LocationDAO;

import com.skilldistillery.cofish.data.ReportDAO;

import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.FishType;
import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;
import com.skilldistillery.cofish.entities.User;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO dao;
	@Autowired
	private FishDAO daoFish;
	@Autowired
	private ReportDAO reportDao;

	@RequestMapping(path = "getReportDetails.do", method = RequestMethod.GET)
	public String populateReportDatails(int reportId, Model model) {
		model.addAttribute("reportDetails", dao.searchReportById(reportId));
		return "cofish/locationsDetails";
	}
//	@RequestMapping(path = "getReportDetails.do", method = RequestMethod.GET)
//	public void populateReportDatails(int reportId, Model model) {
//		model.addAttribute("reportDetails", dao.searchReportById(reportId));
//	}

	@RequestMapping(path = "findLocationById.do", method = RequestMethod.GET)
	public String findLocationById(Integer locationId, Model model) {
		Location foundLocation = dao.findLocationById(locationId);
		List<Report> locationReports = foundLocation.getReports();

		for (Report report : locationReports) {
			List<CaughtFish> reportsFish = report.getCaughtFishList();
			System.out.println(reportsFish.size());
		}

		List<FishType> curFishList = daoFish.findAll();
		model.addAttribute("fishList", curFishList);

		model.addAttribute("location", foundLocation);

		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
	public String createReport(int locationId, Model model, Report report, HttpSession session,
			CaughtFish caughtFishForReport, @RequestParam("fishTypeId") Integer fishTypeId,
			RedirectAttributes redir) {

		Location curLocation = dao.findLocationById(locationId);
		
		User curUser = (User) session.getAttribute("user");
		
		FishType caughtFishType = daoFish.findByIdFishType(fishTypeId);
		
		caughtFishForReport.setFishType(caughtFishType);
//		caughtFishForReport.setReport(newReport); // ROB

		report.setUserProfile(curUser.getUserProfile());
		report.setLocation(curLocation);
		report.addCaughtFish(caughtFishForReport); //ROB
		Report newReport = dao.createReport(report);

		
		CaughtFish cf = daoFish.create(caughtFishForReport);

		newReport.addCaughtFish(cf);
		
		System.out.println("*********** " + newReport.getCaughtFishList().size());
		
		newReport = dao.updateReport(newReport.getId(), newReport);
		
		System.out.println("*********** " + newReport.getCaughtFishList().size());
		
		Location newLocation = dao.findLocationById(newReport.getLocation().getId());
		List<Report> locationReports = newLocation.getReports();

		for (Report reported : locationReports) {
			List<CaughtFish> reportsFish = reported.getCaughtFishList();
			System.out.println(reportsFish.size());
		}
		
		List<FishType> curFishList = daoFish.findAll();
//		model.addAttribute("fishList", curFishList); // of type FishType
//		
//
//		model.addAttribute("location", newLocation);
		redir.addFlashAttribute("fishList", curFishList);
		redir.addFlashAttribute("location", newLocation);
		redir.addFlashAttribute("locationId", locationId);

//		return "cofish/locationsDetails";
		return "redirect:findLocationById.do?locationId=" + locationId;
//		return findLocationById(newLocation.getId(), model);
	}
	
//	@RequestMapping(path = "createReport.do", method = RequestMethod.POST)
//	public String createReport(int locationId, Model model, Report report, HttpSession session
//			, @RequestParam("caughtFishForReport") int caughtFishId){
//		System.out.println("Caught fish ID: " + caughtFishId); //tiger muskie
//		CaughtFish cf = daoFish.findByIdCaughtFish(caughtFishId);
//		Location curLocation = dao.findLocationById(locationId);
//		User curUser = (User) session.getAttribute("user");
//		report.setUserProfile(curUser.getUserProfile());
//		report.setLocation(curLocation);
//		report.addCaughtFish(cf);
//		Report newReport = dao.createReport(report);
//		List<FishType> curFishList = daoFish.findAll();
//		model.addAttribute("fishList", curFishList); //of type FishType
//		
//		List<CaughtFish> caughtFishList = new ArrayList<>();
//		
//		
////		caughtFishList.add(caughtFish);
////		if(caughtFish.length != 0) {
////			for (CaughtFish caughtFish2 : caughtFish) {
////				if(caughtFish2.getReport().isActive()) {
////					CaughtFish fish = reportDao.create(caughtFish2);
////
////					newReport.addCaughtFish(fish);
////				}
////			}
////		}	
////
////		model.addAttribute("caughtFishForReport", new ArrayList<CaughtFish>());
//		System.err.println("IN LOCATION CONTORLLER new report added: " + newReport.getCaughtFishList().size());
//		model.addAttribute("report", newReport);
//		
//		return "cofish/locationsDetails";
//	}

	@RequestMapping(path = "updateReport.do", method = RequestMethod.POST)
	public String updateReport(@RequestParam int id, Model model, Report report) {
		System.err.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + report);
		System.err.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + id);
		
		Report newReport = dao.updateReport(id, report);
		model.addAttribute("report", newReport);
		Location foundLocation = dao.findLocationById(newReport.getLocation().getId());
		
		model.addAttribute("location", foundLocation);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "showAllLocations.do", method = RequestMethod.GET)
	public String showAllLocations(Model model) {
		List<Location> showAllLocations = dao.showAllLocations();
		model.addAttribute("allLocations", showAllLocations);
		return "cofish/searchResults";
	}

	@RequestMapping(path = "showAllReportsForLocation.do", method = RequestMethod.GET)
	public String showAllReportsForLocation(Model model, @RequestParam("locationId") int id) {

		List<Report> allReports = dao.findAllReports(id);
		model.addAttribute("allReports", allReports);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "removeReport.do", method = RequestMethod.POST)
	public String removeReport(Model model, @RequestParam("reportId") int id, Integer locationId) {
		Report reportToRemove = dao.searchReportById(id);
		Location newLocation = dao.findLocationById(reportToRemove.getLocation().getId());
		dao.removeReportFromLocation(reportToRemove, locationId);
		model.addAttribute("location", newLocation);
//			dao.findAllReports(locationId);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "getSearchResults.do", method = RequestMethod.GET)
	public String directSearchByCategory(String searchCategory, String keyword, Model model) {
		System.err.println("**********serach results method***********" + searchCategory);

		if (searchCategory.equals("location")) {
//			System.err.println("******** IN SEARCH method for location********");
			List<Location> searchLocationList = listLocationsByWaterBody(keyword);
//			System.err.println("keyword; " + keyword);
			for (Location location : searchLocationList) {
				System.err.println(location);
			}
			model.addAttribute("allLocations", searchLocationList);
			return "cofish/searchResults";
		}
		if (searchCategory.equals("fish")) {
			List<Location> searchFishList = listLocationsByFish(keyword);
			model.addAttribute("allLocations", searchFishList);
			return "cofish/searchResults";
		} else {
			List<Location> searchAccessList = listLocationsByAccess(keyword);
			System.err.println("********** IN SEARCH ACCESS ELSE BLOCK **********");
			System.err.println(keyword);
			for (Location location : searchAccessList) {
				System.err.println(location);
			}
			model.addAttribute("allLocations", searchAccessList);
			return "cofish/searchResults";
		}
	}

//	@RequestMapping(path= "showLocationsByWaterBody.do", method= RequestMethod.GET)
	public List<Location> listLocationsByWaterBody(String name) {
		List<Location> locationByWaterBody = dao.locationsByWaterBody(name);
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

	@RequestMapping(path = "showLocationsByName.do", method = RequestMethod.GET)
	public String listLocationsByName(Model model, @RequestParam("locationName") String name) {
		List<Location> locationByName = dao.locationsByName(name);
		model.addAttribute("location", locationByName);
		return "cofish/locationsDetails";
	}

	@RequestMapping(path = "showLocationsByRegion.do", method = RequestMethod.GET)
	public String listLocationsByRegion(Model model, @RequestParam("regionName") String region) {
		List<Location> locationByRegion = dao.locationsByRegion(region);
		model.addAttribute("location", locationByRegion);
		return "cofish/locationsDetails";
	}
}
