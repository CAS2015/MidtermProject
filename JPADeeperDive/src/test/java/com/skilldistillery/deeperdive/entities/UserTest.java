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

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entitiy_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("Robert", user.getFirstName());
		assertEquals("Roberts", user.getLastName());
		assertEquals(2021, user.getCreateDate().getYear());
		assertEquals("www.freephotos.com/sunfish.jpg", user.getImageUrl());
		
	}
	
	@Test
	void test_User_to_LocationComment_entitiy_mapping() {
		assertNotNull(user.getLocationComments());
		assertEquals(1, user.getLocationComments().size());
		
	}
	
	@Test
	void test_User_to_LogComment_entitiy_mapping() {
		assertNotNull(user.getLogComments());
		assertEquals(1, user.getLogComments().size());
		
	}
	
	@Test
	void test_User_to_LogEntry_entitiy_mapping() {
		assertNotNull(user.getLogEntries());
		assertEquals(1, user.getLogEntries().size());
		
	}

}
