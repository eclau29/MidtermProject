package com.skilldistillery.cofish.data;

import java.util.List;

import com.skilldistillery.cofish.entities.CaughtFish;
import com.skilldistillery.cofish.entities.FishType;

public interface FishDAO {

	public FishType create(FishType fishType);

	public FishType update(int id, FishType fishType);

	public FishType findByIdFishType(int id);

	public List<FishType> findAll();

	public List<FishType> searchByKewordFT(String keyword);

	public CaughtFish create(CaughtFish caughtFish);

	public CaughtFish update(int id, CaughtFish caughtFish);

	public CaughtFish findByIdCaughtFish(int id);

}
