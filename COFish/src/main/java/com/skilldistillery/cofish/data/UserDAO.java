package com.skilldistillery.cofish.data;

import java.util.List;

import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;
import com.skilldistillery.cofish.entities.User;
import com.skilldistillery.cofish.entities.UserProfile;


//THIS DAO IS FOR USER AND USER PROFILE ENTITIES
public interface UserDAO {

	//User methods
	public User login(String username, String password);
	
	//logout method is in the UserController only
	
	public User registerUser (User user);
	
	public User findUserById(int id);
	
	// UserProfile methods
	public List<Location> getFavLocations(int id);
	
	public List<Report> getUserProfileReportList (int id);
	
	public UserProfile findUserProfileById (int id);

	public Report updateUserProfileReport(int id, int reportId);
	
	public UserProfile removeUserProfileReport(Report reportToRemove, int userProfileId);

//	Stretch goals below:
	public UserProfile updateUserProfile(int id, UserProfile profile);
	
}