 package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.AlramVO;
import com.sist.vo.InterestVO;

public class AlramDAO {
	
	//싱글턴 방식의 객체 제공하기
	private static AlramDAO dao;
	public static AlramDAO getInstance() {
		if(dao == null) {
			dao = new AlramDAO();
		}
		return dao;
	}
	
	private AlramDAO() {		
	}	
	
	public ArrayList<AlramVO> findByinter(String id){
		ArrayList<AlramVO> list = new ArrayList<AlramVO>();
		String sql = "select * from alarm where id = '" + id +"'and al_type = 'inter'";
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
				AlramVO c = new AlramVO();
				c.setAl_no(rs.getInt("al_no"));
				c.setAl_content(rs.getString("al_content"));
				c.setAl_type(rs.getString("al_type"));
				c.setId(rs.getString("id"));
				c.setHouse_no(rs.getInt("house_no"));
				list.add(c);
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
	
	
	
	

	public ArrayList<AlramVO> findByrecoment(String id){
		ArrayList<AlramVO> list = new ArrayList<AlramVO>();
		String sql = "select * from alarm where id = '" + id +"'and al_type = 'recoment'";
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
				AlramVO c = new AlramVO();
				c.setAl_no(rs.getInt("al_no"));
				c.setAl_content(rs.getString("al_content"));
				c.setAl_type(rs.getString("al_type"));
				c.setId(rs.getString("id"));
				c.setHouse_no(rs.getInt("house_no"));
				list.add(c);
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
	
	 
	
	public ArrayList<AlramVO> findAll(String id){
		ArrayList<AlramVO> list = new ArrayList<AlramVO>();
		String sql = "select * from alarm where id = '" + id +"'";
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
				AlramVO b = new AlramVO();
				b.setAl_no(rs.getInt("al_no"));
				b.setAl_content(rs.getString("al_content"));
				b.setAl_type(rs.getString("al_type"));
				b.setId(rs.getString("id"));
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