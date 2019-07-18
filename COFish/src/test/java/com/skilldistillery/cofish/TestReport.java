package com.skilldistillery.cofish;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.cofish.data.ReportDAO;
import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.FishType;
import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;
import com.skilldistillery.cofish.entities.UserProfile;

public class TestReport {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("COFishPU");
	static EntityManager em = emf.createEntityManager();
	private static ReportDAO dao;
	
	public static void main(String[] args) throws ParseException {
		Report report = new Report();
		Location location = em.find(Location.class, 1);
		UserProfile userProfile = em.find(UserProfile.class, 1);
		CaughtFish fish1 = em.find(CaughtFish.class, 1);
		CaughtFish fish = new CaughtFish();
		FishType type = em.find(FishType.class, 1);
		List <CaughtFish> fishs = new ArrayList<>();
//		fish = fish1;
//		System.out.println(fish.getFishType());
//		fishs.add(fish);
//		fishs.get(0).setFishType(type);
//		String date1 = "2019-07-16 11:30:00.0";
//		
//		Date date = null;
//			date = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss").parse(date1);
//		
//		System.out.println(date);
//			report.setComment("Howdy Y'all that was great");
//			report.setDate(date);
//			report.setLocation(location);
//			report.setUserProfile(userProfile);
//			report.setCaughtFishList(fishs);
//			
//			System.out.println(report);
//			System.out.println(report.getLocation());
//			System.out.println(report.getUserProfile());
//			for (CaughtFish caughtFish : fishs) {
//				System.out.println(caughtFish);
//			}
//			System.out.println(report.getCaughtFishList());
//			Report newReport = dao.createReport(report);
//			
//			System.out.println(newReport);
		
	}

}
