package com.skilldistillery.cofish.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.cofish.data.LocationDAO;
import com.skilldistillery.cofish.data.UserDAO;
import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;
import com.skilldistillery.cofish.entities.User;
import com.skilldistillery.cofish.entities.UserProfile;

@Controller
public class UserController {
		
	@Autowired
	private UserDAO dao;
	private LocationDAO locDAO;
	
	@RequestMapping(path = "/")
	public String index() {
		
		return "index";
	}
	
	// USER METHODS
	@RequestMapping(path = "loginUser.do", method = RequestMethod.GET)
	public String loginUser(HttpSession session, 
			@RequestParam("userName") String userName, @RequestParam("password") String password ) {
		session.setAttribute("user", dao.login(userName, password));
		return "cofish/userSplash";
	}
	
	@RequestMapping(path = "logoutUser.do", method = RequestMethod.GET)
	public String logoutUser(HttpSession session) {
		session.removeAttribute("user");
		return "index";
	}
	
	@RequestMapping(path = "registerNewUser.do", method = RequestMethod.POST)
		public String registerNewUser(HttpSession session, @Valid User user) {
		User newUser = dao.registerUser(user);
		System.err.println(newUser);
		if(newUser != null) {
			session.setAttribute("user", newUser);
			
			return "cofish/userSplash";
		}
		else {
			return "index";
		}
	}
	
	@RequestMapping(path = "getUserSplash.do")
	public String userSplashPage(Model model) {
		
 		return "cofish/userSplash";
	}
	
	
	// USER PROFILE METHODS
	
	@ModelAttribute("favLocationsList")
	private List<Location> favLocations(){
		return new ArrayList<>();
	}
	
	//shows a list of favorited locations by UserProfile
	@RequestMapping(path = "getFavLocations.do", method = RequestMethod.GET)
	public String getFavLocations(@ModelAttribute("favLocationsList")List<Location> favList, @RequestParam(value="profileId") int id, Model model) {
		List<Location> curFavList = dao.getFavLocations(id);
		model.addAttribute("favList", curFavList);
		return "showFavLocations";
	}
	// this method adds a new location to a user profile's fav location list and then displays the user's favList.
	@RequestMapping(path = "addFavLocation.do", method = RequestMethod.POST)
	public String addFavLocation(@RequestParam("profileId") int id, UserProfile userProfile, String location, Model model) {
		Location newLocation = locDAO.findLocationByName(location); //merge should fix this compilation error
		UserProfile currentProfile = dao.findUserProfileById(id);
		
		currentProfile.addFavLocation(newLocation);
		dao.updateUserProfile(currentProfile.getId(), currentProfile);
		model.addAttribute("userProfile", currentProfile);
		
		return "showFavLocations";
	}
	
	
	@RequestMapping(path = "removeFavLocation.do", method = RequestMethod.POST)
	public String removeFavLocation(@RequestParam("profileId") int id, UserProfile userProfile, String location, Model model) {
		try {
			Location locToRemove = locDAO.findLocationByName(location); //merge should fix this compilation error
			UserProfile currentProfile = dao.findUserProfileById(id);
			boolean isDeleted = currentProfile.removeFavLocation(locToRemove);
			if (isDeleted) {
				dao.updateUserProfile(currentProfile.getId(), currentProfile);
				model.addAttribute("userProfile", currentProfile);
				return "showFavLocations";
			} else {
				return "generalError";
			}
		} catch (Exception e) {
			return "generalError";
//			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(path = "updateUserProfileReport.do", method = RequestMethod.POST)
	public String updateUserProfileReport(@RequestParam("reportId") int id, Model model, Errors errors, int userProfileId) {
		if (errors.getErrorCount() != 0) {
			return "generalErrror";
		}
		Report updatedReport = dao.updateUserProfileReport(userProfileId, id);
		model.addAttribute("report", updatedReport);
		return "userSplash";
	}
	
	@RequestMapping(path = "removeUserProfileReport.do", method = RequestMethod.POST)
	public String removeUserProfileReport (Model model, @RequestParam("reportId") int id, int userProfileId) {
		Report reportToRemove = locDAO.searchReportById(id);
		dao.removeUserProfileReport(reportToRemove, userProfileId);
		
		return "userSplash";
	}
	
	//STRETCH goals: 
	// update User and UserProfile Information methods

}