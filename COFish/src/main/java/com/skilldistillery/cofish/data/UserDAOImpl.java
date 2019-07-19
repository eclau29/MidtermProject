package com.skilldistillery.cofish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;
import com.skilldistillery.cofish.entities.User;
import com.skilldistillery.cofish.entities.UserProfile;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	// USER METHODS
	@Override
	public User login(String username, String password) {
		System.out.println("************** IN DAOIMPL ************** USERNAME: " + username + "Password: " + password);
		String query = "SELECT u FROM User u WHERE u.userName = :username AND u.password = :password";
		User user = em.createQuery(query, User.class).setParameter("username", username).setParameter("password", password).getSingleResult();
		System.out.println(user);
		return user;
	}

	@Override
	public User registerUser (User user) {
		em.persist(user);
		em.flush();
		
		return user;
	}
	
	@Override
	public User findUserById(int id) {
		
		return em.find(User.class, id);
	}
	
//	public User updateUser(int userId) {} //stretch goal

	// USER PROFILE METHODS
	public UserProfile findUserProfileById (int id) {
		
		return em.find(UserProfile.class, id);
	}
	
	@Override
	public List<Location> getFavLocations(int id) {
		User user = em.find(User.class, id);
		List<Location> favLocations = user.getUserProfile().getFavoriteLocations();
		return favLocations;
	}
	
	
	@Override
	public List<Report> getUserProfileReportList (@RequestParam("profileId") int id){
		UserProfile userProfile = em.find(UserProfile.class, id);
		List<Report> reportList = userProfile.getReports();
		
		return reportList;
	}
	
	@Override
	public Report updateUserProfileReport(int id, int reportId) {
		
		return null;
	}
	
	@Override
	public UserProfile removeUserProfileReport(Report reportToRemove, int userProfileId) {
		UserProfile foundUserProfile = findUserProfileById(userProfileId);
		foundUserProfile.getReports().remove(reportToRemove);
		em.persist(foundUserProfile);
		em.flush();
		
		return foundUserProfile;
	}
	
	@Override
	public UserProfile updateUserProfile (int id, UserProfile profile) {
		UserProfile profileToUpdate = em.find(UserProfile.class, id);
		
		profileToUpdate.setFirstName(profile.getFirstName());
		profileToUpdate.setLastName(profile.getLastName());
		profileToUpdate.setCity(profile.getCity());
		profileToUpdate.setState(profile.getState());
		profileToUpdate.setAboutMe(profile.getAboutMe());
		profileToUpdate.setImageUrl(profile.getImageUrl());
		
		return profileToUpdate;
	}
	
	
	
	
}
