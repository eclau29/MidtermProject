package com.skilldistillery.cofish.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
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

public class FishTypeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private FishType fishType;

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
		fishType = em.find(FishType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		fishType = null;
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_FishType_mapping() {
		assertEquals("Rainbow Trout", fishType.getName());
		assertEquals(1, fishType.getId());
	}
	
	@Test
	void test_FishType_to_CaughtFish_Association() {
		assertNotNull(fishType.getCaughtFishes());
		assertTrue(fishType.getCaughtFishes().size() > 0);
		assertEquals("23", fishType.getCaughtFishes().size());
	}
}



















