package com.skilldistillery.cofish.data;

import java.util.List;

import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;

public interface LocationDAO {

	public List<Report> findAllReports(int id);

	public Report createReport(Report report);

	public Report updateReport(int id, Report report);

	public Location findLocationByName(String locationName);

	public Report searchReportById(int id);

	public Location findLocationById(int id);

	public Location removeReportFromLocation(Report report, int locationId);

	List<Location> locationsByName(String name);

	List<Location> locationsByWaterBody(String name);

	List<Location> locationsByRegion(String name);

	List<Location> locationsByAccessibility(String name);

	List<Location> locationByFishName(String name);

}
