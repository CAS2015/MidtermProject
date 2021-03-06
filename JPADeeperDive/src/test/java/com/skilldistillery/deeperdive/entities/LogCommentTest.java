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

class LogCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private LogComment logComment;
	
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
		logComment = em.find(LogComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		logComment = null;
	}

	@Test
	void test_LogComment_entitiy_mapping() {
		assertNotNull(logComment);
		assertNotNull(logComment.getContent());
		assertTrue(logComment.getContent().length() > 0);
		assertEquals(1, logComment.getId());
	}
	
	@Test
	void test_LogComment_to_User_entitiy_mapping() {
		assertNotNull(logComment.getUser());
		assertEquals(1, logComment.getUser().getId());
	}
	
	@Test
	void test_LogComment_to_LogEntry_entity_mapping() {
		assertNotNull(logComment.getLogEntry());
		assertEquals("Where do I being? I was there all alone, and then I saw all of these wonderful things on this dive", logComment.getLogEntry().getLogContent());
		assertEquals(31, logComment.getLogEntry().getDiveDate().getDayOfMonth());
	}

}
