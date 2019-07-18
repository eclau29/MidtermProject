package com.skilldistillery.cofish;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.skilldistillery.cofish.data.ReportDAO;
import com.skilldistillery.cofish.entities.Location;
import com.skilldistillery.cofish.entities.Report;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CoFishApplicationTests {
	private ReportDAO dao;
	

	@Test
	public void contextLoads() {
		
	}

	
}
