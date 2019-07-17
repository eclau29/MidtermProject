package com.skilldistillery.cofish.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class RatingTest {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("COFishPU");
	private EntityManager em;
	private Rating rating;
	private RatingId ratingId;

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		ratingId = new RatingId(1, 1);
		rating = em.find(Rating.class, ratingId);
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
	void test_rating_mappings() {
		assertNotNull(rating.getDate());
		assertEquals("Waterton Canyon",rating.getLocation().getName());
		assertEquals("South Platte", rating.getLocation().getWaterBody());
		assertEquals(3, rating.getRating());
		assertEquals("Fishermen", rating.getUserProfile().getLastName());
	}

}
