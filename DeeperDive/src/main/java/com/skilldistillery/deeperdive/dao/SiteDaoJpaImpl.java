package com.skilldistillery.deeperdive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.Site;

@Service
@Transactional
public class SiteDaoJpaImpl implements SiteDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Site findSiteById(int id) {
		return em.find(Site.class, id);
	}

	@Override
	public List<Site> findAllSites() {
		List<Site> sites;

		String jpql = "SELECT s FROM Site s";

		sites = em.createQuery(jpql, Site.class).getResultList();

		return sites;
	}


	@Override
	public Site findSitesByName(String siteName) {
		Site site = null;
		
		String jpql = "SELECT s FROM Site s WHERE s.name = :siteName";
		
		try {
			site = em.createQuery(jpql, Site.class).setParameter("siteName",siteName).getSingleResult();
		} catch (Exception e) {
			return null;
		}		
		return site;
	}

}
