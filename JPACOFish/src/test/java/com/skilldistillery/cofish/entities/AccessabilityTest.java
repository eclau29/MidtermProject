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

class AccessabilityTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Accessability acce;

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
		acce = em.find(Accessability.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		acce = null;
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_Accessibility_Mapping() {
		assertEquals(1, acce.getId());
		assertEquals("Easy", acce.getName());
	}

}















