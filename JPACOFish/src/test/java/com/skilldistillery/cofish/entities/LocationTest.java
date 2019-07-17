package com.skilldistillery.cofish.entities;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class LocationTest {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("COFishPU");
	private static EntityManager em;
	private Location location; 

//	@BeforeAll
//	static void setUpBeforeClass() throws Exception {
//	}
//
//	@AfterAll
//	static void tearDownAfterClass() throws Exception {
//	}
//	
	@BeforeEach
	void setUp() throws Exception {
			em = emf.createEntityManager();
			location = em.find(Location.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}
	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void test_location_mappings() {
		assertNotNull(location);
		assertTrue(location.getRatings().size() > 0);
		assertTrue(location.getLocationComments().size() > 0);
		assertTrue(location.getReports().size() > 0);
		assertEquals("2019-07-16 11:30:00.0", location.getLocationComments().get(0).getCommentDate().toString());
		assertEquals("Rainbow Trout", location.getReports().get(0).getCaughtFishList().get(0).getFishType().getName());
	}
}
