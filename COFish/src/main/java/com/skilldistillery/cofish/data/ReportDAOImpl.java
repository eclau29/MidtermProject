package com.skilldistillery.cofish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.Report;

@Service
@Transactional
public class ReportDAOImpl implements ReportDAO{

	@PersistenceContext
	private EntityManager em;
	
	// Creates a new Report
	@Override
	public Report searchReportById(int id) {
		return em.find(Report.class, id);
	}
	
	@Override
	public Report createReport(Report report ) {
		Report newReport = new Report();
//		newReport.setCaughtFishList(report.getCaughtFishList());
		newReport.setLocation(report.getLocation());
		newReport.setDate(report.getDate());
		newReport.setComment(report.getComment());
		newReport.setUserProfile(report.getUserProfile());
		em.persist(newReport);
		em.flush();
		return newReport;
	}
	
	@Override
	public Report updateReport(Report report, int id) {
		Report newReport = em.find(Report.class, id);
//		newReport.setCaughtFishList(report.getCaughtFishList());
		newReport.setLocation(report.getLocation());
		newReport.setDate(report.getDate());
		newReport.setComment(report.getComment());
		newReport.setUserProfile(report.getUserProfile());
		return newReport;
	}
	
	
	
	@Override
	public boolean deleteReport(int id) {
		Report report = em.find(Report.class, id);
		report.setActive(false);
		return true;
	}
	
	@Override
	public Report findReportById(int id) {
		return em.find(Report.class, id);
	}
	
	@Override
	public CaughtFish findByIdCaughtFish(int id) {
		return em.find(CaughtFish.class, id);
	}
	
	@Override
	public CaughtFish create(CaughtFish caughtFish) {
		em.persist(caughtFish);
		em.flush();
		return caughtFish;
	}
	
	@Override
	public CaughtFish update(int id, CaughtFish caughtFish) {
		CaughtFish updateCaughtFish = em.find(CaughtFish.class, id);
		updateCaughtFish.setLengthInches(caughtFish.getLengthInches());
		updateCaughtFish.setFishType(caughtFish.getFishType());
		updateCaughtFish.setWeightLbs(caughtFish.getWeightLbs());
		updateCaughtFish.setRodType(caughtFish.getRodType());
		updateCaughtFish.setLureType(caughtFish.getLureType());
		updateCaughtFish.setComment(caughtFish.getComment());
		return updateCaughtFish;
	}
	
	@Override
	public List<CaughtFish> findCaughtFishByReportId(int id) {
		String query = "SELECT cf FROM CaughtFish cf WHERE cf.reportId = :id";
		List <CaughtFish> fishFound = em.createQuery(query, CaughtFish.class).setParameter("id", id).getResultList();
		return fishFound;
	}
	

}
