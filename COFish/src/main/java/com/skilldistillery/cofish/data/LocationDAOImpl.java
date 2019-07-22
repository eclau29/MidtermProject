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
			System.err.println("********* in location dao ******** Report: " + report);
			em.persist(report);
			System.err.println("********* in location dao after persist******** Report: " + report);
			
			em.flush();
			return report;
		}
		
		@Override//RM done
		public Report updateReport(int id, Report report) {
			Report updateReport = em.find(Report.class, id);
			updateReport.setComment(report.getComment());
			//updateReport.setDate(report.getDate());
			return updateReport;
		}
		
		@Override
		public Location removeReportFromLocation(Report report, int locationId) {
			Location findLocation = findLocationById(locationId);
			findLocation.getReports().remove(report);
			em.persist(findLocation);
			em.flush();
			
			return findLocation;
		}
		
		@Override
		public Report searchReportById(int id) {
			return em.find(Report.class, id);
		}
		
		@Override//RM DONE
		public List<Report> findAllReports(int id){
			String query = "Select r From Report r where r.location.id = :id AND where r.active = 1";
			List<Report> listAllReportsForLocation = em.createQuery(query, Report.class)
														.setParameter("id", id)
														.getResultList();
			return listAllReportsForLocation;
		}
		
//		@Override
//		public boolean removeReport(int id) {
//			Report report = em.find(Report.class, id);
//			report.setActive(false);
//			return true;
//		}
		
		@Override
		public Location findLocationById(int id) {
			String query ="Select loc From Location loc Where loc.id = :id";
			Location foundLocation = em.createQuery(query, Location.class)
									   .setParameter("id", id)
									   .getSingleResult();
			return foundLocation;
		}
		
		@Override
		public List<Location> locationsByName(String name){
			String query = "SELECT loc from Location loc WHERE loc.name LIKE :name ";
			List<Location> locationsByName = em.createQuery(query, Location.class).setParameter("name", "%" + name + "%").getResultList();
			return locationsByName ;
		}
		
		@Override
		public List<Location> locationsByWaterBody(String name){
			String query = "SELECT loc from Location loc WHERE loc.waterBody LIKE :name ";
			List<Location> locationsByName = em.createQuery(query, Location.class).setParameter("name", "%" + name + "%").getResultList();
			return locationsByName ;
		}
		
		@Override
		public List<Location> locationsByRegion(String name){
			String query = "SELECT loc from Location loc WHERE loc.area LIKE :name ";
			List<Location> locationsByName = em.createQuery(query, Location.class).setParameter("name", "%" + name + "%").getResultList();
			return locationsByName ;
		}
		
		@Override
		public List<Location> locationsByAccessibility(String name){
			String query = "SELECT loc from Location loc WHERE loc.access.name LIKE :name ";
			List<Location> locationsByName = em.createQuery(query, Location.class).setParameter("name", "%" + name + "%").getResultList();
			return locationsByName ;
		}
		
		@Override
		public List<Location> locationByFishName(String name){
			String query = "SELECT loc FROM Location loc WHERE loc.reports.caughtFishList.fishType.name LIKE :name ";
			List<Location> locationByFishName = em.createQuery(query, Location.class).setParameter("name", "%" + name + "%").getResultList();
			return locationByFishName;
		}
		
		@Override
		public List<Location> showAllLocations(){
			String query = "Select loc From Location loc ORDER BY loc.name ASC";
			List<Location> showAllLocations = em.createQuery(query, Location.class).getResultList();
			return showAllLocations;
		}
		
		
		//FOR EMILY'S SPECIAL NEEDS
		@Override
		public Location findLocationByName (String locationName) {
			String query = "SELECT loc FROM Location loc WHERE loc.name = :locName";
			Location foundLocation = em.createQuery(query, Location.class).setParameter("locName", locationName).getSingleResult();
			return foundLocation;
		}
		
		
}


















