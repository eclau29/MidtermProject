package com.skilldistillery.cofish.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class CaughtFishTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CaughtFish caughtFish;

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
		caughtFish = em.find(CaughtFish.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		caughtFish = null;
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_CaughtFish_Mapping() {
		assertEquals(1, caughtFish.getReport().getId());
		assertEquals(1, caughtFish.getFishType().getId());
		assertEquals(13, caughtFish.getLengthInches());
		assertEquals(3.2, caughtFish.getWeightLbs());
		assertEquals("Hoppers/Stimulators/GoldenStone nymph", caughtFish.getLureType()	);	
	}

	@Test
	void test_CaughtFish_to_FishType_Association() {
		assertNotNull(caughtFish.getFishType());
		assertEquals("Rainbow Trout", caughtFish.getFishType().getName());
		
	}
}











