package com.skilldistillery.cofish.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
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
	
//	@Test
//	void test_get_UserProfile_info() {
//		assertEquals(expected, actual);
//	}

}
