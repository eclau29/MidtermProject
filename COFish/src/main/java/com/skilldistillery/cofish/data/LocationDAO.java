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

	public List<Location> locationsByName(String name);

	public List<Location> locationsByWaterBody(String name);

	public List<Location> locationsByRegion(String name);

	public List<Location> locationsByAccessibility(String name);

	public List<Location> locationByFishName(String name);

	public List<Location> showAllLocations();

}
