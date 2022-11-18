package com.sist.dao;

public class MemberDAO {
	private static MemberDAO dao;
	private MemberDAO() {
		
	}
	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	

}
