package com.skilldistillery.deeperdive.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SiteTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Site site;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("DeeperDive");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		site = em.find(Site.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		site = null;
	}

	@Test
	void test_Site_entitiy_mapping() {
		assertNotNull(site);
		assertEquals("Fake Lake ", site.getName());
		assertEquals("open water", site.getMinimumCert());
		assertEquals("Lots of stuff in this great diving site", site.getDescription());
		
	}
	
	@Test
	void test_Site_to_Location_entitiy_mapping() {
		assertNotNull(site.getLocation());
		assertEquals(1, site.getLocation().getId());
	}

}
