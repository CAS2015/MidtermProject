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

class DiveTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private DiveType diveType;
	
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
		diveType = em.find(DiveType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		diveType = null;
	}

	@Test
	void test_DiveType_entitiy_mapping() {
		assertNotNull(diveType);
		assertEquals("admin", diveType.getName());
		assertEquals(1, diveType.getId());
	}

}
