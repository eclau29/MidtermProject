//package com.skilldistillery.cofish.controllers;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import com.skilldistillery.cofish.data.LocationDAO;
//import com.skilldistillery.cofish.data.UserDAO;
//import com.skilldistillery.cofish.entities.Location;
//import com.skilldistillery.cofish.entities.User;
//import com.skilldistillery.cofish.entities.UserProfile;
//
//@Controller
//@SessionAttributes("loggedUserHx")
//public class UserController {
//		
//	@Autowired
//	private UserDAO dao;
//	private LocationDAO locDAO;
//	
//	// USER METHODS
//	@RequestMapping(path = "loginUser.do", method = RequestMethod.GET)
//	public String loginUser(@Valid User user, HttpSession session) {
//		System.out.println("****************IN CONTROLLER" + user);
//		User loggedUser = dao.login(user.getUserName(), user.getPassword());
//		
//		session.setAttribute("user", loggedUser);
//		return "index";
//	}
//	
//	@RequestMapping(path = "logoutUser.do", method = RequestMethod.GET)
//	public String logoutUser(@Valid User user) {
//		//FIXME
//	return null;
//	}
//	
//	@RequestMapping(path = "registerNewUser.do", method = RequestMethod.POST)
//		//FIXME
//	
//	
//	
//	// USER PROFILE METHODS
//	
//	@ModelAttribute("favLocationsList")
//	private List<Location> favLocations(){
//		return new ArrayList<>();
//	}
//	
//	//shows a list of favorited locations by UserProfile
//	@RequestMapping(path = "getFavLocations.do", method = RequestMethod.GET)
//	public String getFavLocations(@ModelAttribute("favLocationsList")List<Location> favList, @RequestParam(value="profileId") int id, Model model) {
//		List<Location> curFavList = dao.getFavLocations(id);
//		model.addAttribute("favList", curFavList);
//		return "showFavLocations";
//	}
//	// this method adds a new location to a user profile's fav location list and then displays the user's favList.
//	@RequestMapping(path = "addFavLocation.do", method = RequestMethod.POST)
//	public String addFavLocation(@RequestParam("profileId") int id, UserProfile userProfile, String location, Model model) {
//		Location newLocation = locDAO.findLocationByName(location); //merge should fix this compilation error
//		UserProfile currentProfile = dao.findUserProfileById(id);
//		
//		currentProfile.addFavLocation(newLocation);
//		dao.updateUserProfile(currentProfile.getId(), currentProfile);
//		model.addAttribute("userProfile", currentProfile);
//		
//		return "showFavLocations";
//	}
//	
//	@RequestMapping(path = "removeFavLocation.do", method = RequestMethod.POST)
//	public String removeFavLocation(@RequestParam("profileId") int id, UserProfile userProfile, String location, Model model) {
//		try {
//			Location locToRemove = locDAO.findLocationByName(location); //merge should fix this compilation error
//			UserProfile currentProfile = dao.findUserProfileById(id);
//			boolean isDeleted = currentProfile.removeFavLocation(locToRemove);
//			if (isDeleted) {
//				dao.updateUserProfile(currentProfile.getId(), currentProfile);
//				model.addAttribute("userProfile", currentProfile);
//				return "showFavLocations";
//			} else {
//				return "generalError";
//			}
//		} catch (Exception e) {
//			return "generalError";
////			e.printStackTrace();
//		}
//		
//	}
//
//}
