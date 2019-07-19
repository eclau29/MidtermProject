package com.skilldistillery.cofish.data;

import java.util.List;

import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.Report;

public interface ReportDAO {

	Report updateReport(Report report, int id);

	boolean deleteReport(int id);

	Report createReport(Report report);

	CaughtFish findByIdCaughtFish(int id);

	CaughtFish update(int id, CaughtFish caughtFish);

	Report searchReportById(int id);

	List <CaughtFish> findCaughtFishByReportId(int id);

	CaughtFish create(CaughtFish caughtFish);

	Report findReportById(int id);

	

}
