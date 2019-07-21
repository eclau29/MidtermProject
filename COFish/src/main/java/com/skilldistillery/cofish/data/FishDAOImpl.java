package com.skilldistillery.cofish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.FishType;

@Service
@Transactional
public class FishDAOImpl implements FishDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	//METHODS FOR FISHTYPE
	
	@Override
	public FishType create(FishType fishType) {
		
		em.persist(fishType);
		em.flush();
		
		return fishType;
	}
	
	@Override
	public FishType update (int id, FishType fishType) {
		FishType updateTypeFish = em.find(FishType.class, id);
		
		//updateTypeFish.setId(fishType.getId());
		updateTypeFish.setName(fishType.getName());
		updateTypeFish.setImageUrl(fishType.getImageUrl());
		updateTypeFish.setDescription(fishType.getDescription());
		updateTypeFish.setWikiUrl(fishType.getWikiUrl());
		
		return updateTypeFish;
	}
	
	@Override
	public FishType findByIdFishType(int id) {
		System.err.println(id + "****************************************************888888888");
		return em.find(FishType.class, id);
	}
	
	@Override
	public List<FishType> findAll(){
		String query = "Select ft From FishType ft";
		List<FishType> foundFishType = em.createQuery(query, FishType.class)
										 .getResultList();
		return foundFishType;
	}

	@Override
	public List<FishType> searchByKewordFT(String keyword){
		String query = "Select DISTINCT(ft) From FishType ft Where ft.name like :keyword";
		List<FishType> listByKeword = em.createQuery(query, FishType.class)
										.setParameter("keyword", "%" + keyword + "%")
										.getResultList();
		for (FishType fishType : listByKeword) {
			System.out.println(fishType.getName());
		}
		return listByKeword;
	}
	
	//METHODS FOR CAUGHTFISH
	
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
		updateCaughtFish.setWeightLbs(caughtFish.getWeightLbs());
		updateCaughtFish.setRodType(caughtFish.getRodType());
		updateCaughtFish.setLureType(caughtFish.getLureType());
		updateCaughtFish.setComment(caughtFish.getComment());
		return updateCaughtFish;
	}
	
	
	
	

}









