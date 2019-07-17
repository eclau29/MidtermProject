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

class LocationCommentTest {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("COFishPU");
	private EntityManager em;
	private LocationComment comment;
	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		comment = em.find(LocationComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		comment = null;
		em.close();
	}
	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_location_comment_mapping() {
		assertNotNull(comment);
		assertEquals(1, comment.getLocation().getId());
		assertEquals("2019-07-16 11:30:00.0", comment.getCommentDate().toString());
		assertEquals("That was wild y'all", comment.getCommentText());
		assertEquals(1, comment.getUserProfile());
	}
	
	

}
