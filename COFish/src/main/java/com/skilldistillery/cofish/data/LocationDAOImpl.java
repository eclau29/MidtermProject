package com.skilldistillery.cofish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;

@Service
@Transactional
public class LocationDAOImpl implements LocationDAO{

		@PersistenceContext
		private EntityManager em;
		
		//METHODS FOR ONETOMANY FOR REPORTS
		
		@Override//RM done
		public Report createReport(Report report) {
			em.persist(report);
			em.flush();
			return report;
		}
		
		@Override//RM done
		public Report updateReport(int id, Report report) {
			Report updateReport = em.find(Report.class, id);
			updateReport.setComment(report.getComment());
			updateReport.setDate(report.getDate());
			return updateReport;
		}
		
		@Override
		public Report searchReportById(int id) {
			return em.find(Report.class, id);
		}
		
		@Override
		public List<Report> findAllReports(){
			String query = "Select r From Report r where r.location.id = :id";
			List<Report> listAllReportsForLocation = em.createQuery(query, Report.class)
														.getResultList();
			return listAllReportsForLocation;
		}
		
		
		@Override//NO MAPPING NEEDED
		public boolean deleteReport(int id) {
			Report report = em.find(Report.class, id);
			//report.setActive(false);
			return true;
		}
		
		
		
		
		//FOR EMILY'S SPECIAL NEEDS
		@Override
		public Location findLocationByName (String locationName) {
			String query = "SELECT loc FROM Location loc WHERE loc.name = :locName";
			Location foundLocation = em.createQuery(query, Location.class).setParameter("locName", locationName).getSingleResult();
			return foundLocation;
		}
		
}


















