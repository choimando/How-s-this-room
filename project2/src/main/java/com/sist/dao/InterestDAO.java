 package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.InterestVO;

public class InterestDAO {
	
	//싱글턴 방식의 객체 제공하기
	private static InterestDAO dao;
	public static InterestDAO getInstance() {
		if(dao == null) {
			dao = new InterestDAO();
		}
		return dao;
	}
	
	private InterestDAO() {		
	}	
			


	
	//관심목록을 등록하기 위한 메소드를 정의
	 
	public int insertInterest(InterestVO b) {
		int re = -1;
		String sql = "insert into Interest(inter_no, inter_title, inter_img, id, house_id, house_no) values(?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds =(DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getInter_no());
			pstmt.setString(2, b.getInter_title());
			pstmt.setString(3, b.getInter_img());
			pstmt.setString(4, b.getId());
			pstmt.setString(5, b.getHouse_id());
			pstmt.setInt(6, b.getHouse_no());
			re = pstmt.executeUpdate();			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {			
			if(pstmt != null) { try{pstmt.close();}catch(Exception e) {} }
			if(conn != null) { try{conn.close();}catch(Exception e) {} }
		}				
		return re;
	}
	
	
	
	
	

	//관심목록 삭제
	public int deleteInterest(int inter_no) {
		int re = -1;
		String sql = "delete Interest where inter_no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds =(DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, inter_no);
			re = pstmt.executeUpdate();			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {			
			if(pstmt != null) { try{pstmt.close();}catch(Exception e) {} }
			if(conn != null) { try{conn.close();}catch(Exception e) {} }
		}				
		return re;
	}
	
	
	
	
	
	//관심 목록을 반환하는 메소드 정의
	//select * from Interest
	public ArrayList<InterestVO> findById(String id){
		ArrayList<InterestVO> list = new ArrayList<InterestVO>();
		String sql = "select * from Interest where id = '" + id +"'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds =(DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				InterestVO b = new InterestVO();
				b.setInter_no(rs.getInt("inter_no"));
				b.setInter_title(rs.getString("inter_title"));
				b.setInter_img(rs.getString("inter_img"));
				b.setId(rs.getString("id"));
				b.setHouse_id(rs.getString("house_id"));
				b.setHouse_no(rs.getInt("house_no"));
				list.add(b);
			}
			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			if(rs != null) { try{rs.close();}catch(Exception e) {} }
			if(stmt != null) { try{stmt.close();}catch(Exception e) {} }
			if(conn != null) { try{conn.close();}catch(Exception e) {} }
		}
		
		return list;
	}
	
}