package com.skilldistillery.cofish.data;

import java.util.List;

import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.User;
import com.skilldistillery.cofish.entities.UserProfile;

public interface UserDAO {

	public User login(String username, String password);
	
	public User logout(int id);
	
	public User findUserById(int id);

	public List<Location> getFavLocations(int id);
	
	public UserProfile findUserProfileById (int id);

	public UserProfile updateUserProfile(int id, UserProfile profile);
	
}