package com.sist.dao;

public class HouseDAO {
	private static HouseDAO dao;
	
	public static HouseDAO getInstance() {
		if(dao == null) {
			dao = new HouseDAO();
		}
		return dao;
	}
}
