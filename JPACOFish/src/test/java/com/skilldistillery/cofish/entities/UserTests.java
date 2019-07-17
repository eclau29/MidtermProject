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

class UserTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
		em.close();
	}
	
	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_get_User_Info () {
		assertEquals("fisher", user.getUserName());
		assertEquals("fisher", user.getPassword());
		assertEquals(1, user.getRole());
		assertEquals(true, user.isActive());
	}
	
	@Test
	void test_get_User_Profile_Info() {
		assertEquals("Bob", user.getUserProfile().getFirstName());
		assertEquals("I fish for food", user.getUserProfile().getAboutMe());
		assertEquals("2019-07-16 11:09:00.0", user.getUserProfile().getDateCreated().toString());
		
	}
	
	@Test
	void test_User_can_get_its_list_of_reports() {
		assertNotNull(user.getUserProfile().getReports());
		assertTrue(user.getUserProfile().getReports().size() > 0);
		assertEquals(1, user.getUserProfile().getReports().size());
		assertEquals("Great spot to fish caught me a big trout", user.getUserProfile().getReports().get(0).getComment());
	}

}
