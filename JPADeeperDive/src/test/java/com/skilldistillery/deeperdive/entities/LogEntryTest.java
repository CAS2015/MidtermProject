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

class LogEntryTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private LogEntry logEntry;
	
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
		logEntry = em.find(LogEntry.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		logEntry = null;
	}

	/*+----+---------+---------+----------------------------------------------------------------------------------------------------+-------------------+------------+------------+--------+------------------+--------------------------------------+----------------------------------+----------+------------+---------------------+---------------------+--------------------+------------------+----------+-------------------+
| id | user_id | site_id | log_content                                                                                        | title             | dive_date  | entry_time | rating | max_depth_meters | equipment                            | img_url                          | end_time | visibility | created_at          | last_updated        | start_pressure_bar | end_pressure_bar | air_type | attraction        |
+----+---------+---------+----------------------------------------------------------------------------------------------------+-------------------+------------+------------+--------+------------------+--------------------------------------+----------------------------------+----------+------------+---------------------+---------------------+--------------------+------------------+----------+-------------------+
|  1 |       1 |       1 | Where do I being? I was there all alone, and then I saw all of these wonderful things on this dive | My Best Fake Dive | 2020-12-31 | 08:00:00   |      5 |              200 | 3mm shortie, other stuff, split fins | www.fakeimages.com/squidfins.jpg | 10:00:00 | 4          | 2020-11-30 23:59:59 | 2020-12-14 23:59:59 |                200 |               79 | Nitrox   | sunfish mola mola |
+----+---------+---------+----------------------------------------------------------------------------------------------------+-------------------+------------+------------+--------+------------------+--------------------------------------+----------------------------------+----------+------------+---------------------+---------------------+--------------------+------------------+----------+-------------------+
*/
	
	@Test
	void test_LogEntry_entitiy_mapping() {
		assertNotNull(logEntry);
		assertEquals("Where do I being? I was there all alone, and then I saw all of these wonderful things on this dive", logEntry.getLogContent());
		assertEquals(31, logEntry.getDiveDate().getDayOfMonth());
		assertEquals(8, logEntry.getEntryTime().getHour());
		assertEquals(200, logEntry.getMaxDepthMeters());
		assertEquals("www.fakeimages.com/squidfins.jpg", logEntry.getImageUrl());
		assertEquals(10, logEntry.getEndTime().getHour());
		assertEquals(2020, logEntry.getCreatedAt().getYear());
		assertEquals(2020, logEntry.getLastUpdated().getYear());
		assertEquals(200, logEntry.getStartPressureBar());
		assertEquals(79, logEntry.getEndPressureBar());
		assertEquals("Nitrox", logEntry.getAirType());
		
	}
	
	@Test
	void test_LogEntry_to_User_entitiy_mapping() {
		assertNotNull(logEntry.getUser());
		assertEquals(1, logEntry.getUser().getId());
	}
	
	@Test
	void test_LogEntry_to_Site_entitiy_mapping() {
		assertNotNull(logEntry.getSite());
		assertEquals(1, logEntry.getSite().getId());
	}
	
	
}
