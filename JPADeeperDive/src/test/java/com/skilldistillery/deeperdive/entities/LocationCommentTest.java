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

class LocationCommentTest {


	private static EntityManagerFactory emf;
	private EntityManager em;
	private LocationComment locationComment;
	
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
		locationComment = em.find(LocationComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		locationComment = null;
	}

	@Test
	void test_LocationComment_entitiy_mapping() {
		assertNotNull(locationComment);
		assertEquals("admin", locationComment.getContent());
		assertEquals(1, locationComment.getId());
	}

}
