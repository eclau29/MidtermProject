package com.skilldistillery.cofish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cofish.entities.Location;
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
	public User logout(int id) {
		// FIXME
		return null;
	}
	
	@Override
	public User findUserById(int id) {
		
		return em.find(User.class, id);
	}

	// USER PROFILE METHODS
	@Override
	public List<Location> getFavLocations(int id) {
		User user = em.find(User.class, id);
		List<Location> favLocations = user.getUserProfile().getFavoriteLocations();
		return favLocations;
	}
	
	public UserProfile findUserProfileById (int id) {
		
		return em.find(UserProfile.class, id);
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
