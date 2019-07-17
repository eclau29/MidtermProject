package com.skilldistillery.cofish.entities;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class UserProfileTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserProfile userProfile;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("COFishPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		userProfile = em.find(UserProfile.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		userProfile = null;
		em.close();
	}
	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_get_UserProfile_info() {
		assertEquals("Fishermen", userProfile.getLastName());
		assertEquals("Colorado", userProfile.getState());
	}
	@Test
	void test_UserProfile_knows_its_list_of_reports() {
		assertNotNull(userProfile.getReports());
		assertTrue(userProfile.getReports().size() > 0);
		assertEquals("2019-07-16 11:30:00.0", userProfile.getReports().get(0).getDate().toString());
	}
	@Test
	void test_UserProfile_knows_its_list_of_locationComments() {
		assertNotNull(userProfile.getLocationComments());
		assertTrue(userProfile.getLocationComments().size() > 0);
		assertEquals("That was wild y'all", userProfile.getLocationComments().get(0).getCommentText());
		assertEquals("2019-07-16 11:30:00.0", userProfile.getLocationComments().get(0).getCommentDate().toString());
		assertEquals(1, userProfile.getLocationComments().get(0).getUserProfile().getId());
		assertEquals("Waterton Canyon", userProfile.getLocationComments().get(0).getLocation().getName());
		
	}
	
	@Test
	void test_UserProfile_knows_its_list_of_ratings () {
		assertNotNull(userProfile.getRatings());
		assertTrue(userProfile.getRatings().size() > 0);
		assertEquals(3, userProfile.getRatings().get(0).getRating());
	}
	
	@Test
	void test_UserProfile_knows_its_favorite_locations() {
		assertNotNull(userProfile.getFavoriteLocations());
		assertTrue(userProfile.getFavoriteLocations().size() > 0);
		assertEquals(-105.09325, userProfile.getFavoriteLocations().get(0).getLatitude());
	}

}
