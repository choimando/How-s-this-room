package com.sist.dao;

public class MemberDAO {
	public static MemberDAO dao;
	private MemberDAO() {
		
	}
	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
}
