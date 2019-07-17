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

class ReportTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Report report;

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
		report = em.find(Report.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		report = null;
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void test_Report_Mapping() {
		assertEquals("Great spot to fish caught me a big trout", report.getComment());
		assertEquals("2019-07-16 11:30:00.0", report.getDate().toString());
	}

	@Test
	void test_Report_to_CaughtFish_Mapping() {
		assertNotNull(report.getCaughtFishList());
		assertTrue(report.getCaughtFishList().size() > 0);
		assertEquals("Rainbow Trout", report.getCaughtFishList().get(0).getFishType().getName());
	}
	@Test
	void test_Report_to_UserProfile_Mapping() {
		assertNotNull(report.getUserProfile());
		assertEquals("Bob", report.getUserProfile().getFirstName());
	}
	@Test
	void test_Report_to_Location_Mapping() {
		assertNotNull(report.getLocation());
		assertEquals("Waterton Canyon", report.getLocation().getName());
	}
	
}
