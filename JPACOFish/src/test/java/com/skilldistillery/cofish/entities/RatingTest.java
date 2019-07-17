package com.skilldistillery.cofish.entities;

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

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		rating = em.find(Rating.class, 1);
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
		
	}

}
