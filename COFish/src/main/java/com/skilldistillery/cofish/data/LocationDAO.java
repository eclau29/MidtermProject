package com.skilldistillery.cofish.data;

import java.util.List;

import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;

public interface LocationDAO {

	public List<Report> findAllReports();

	public Report createReport(Report report);

	public Report updateReport(int id, Report report);

	public Location findLocationByName(String locationName);

	public Report searchReportById(int id);

	public boolean deleteReport(int id);

}
