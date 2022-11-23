package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.HouseVO;
import com.sist.vo.RecommendVO;

public class HouseDAO {
	private static HouseDAO dao;
	
	private HouseDAO() {
		
	};
	
	public static HouseDAO getInstance() {
		if(dao == null) {
			dao = new HouseDAO();
		}
		return dao;
	}
	// 위도, 경도 불러오기 메소드
	public ArrayList<HouseVO> getLatLng(){
		ArrayList<HouseVO> list = new ArrayList<HouseVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select lat,lng from house ";
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HouseVO h = new HouseVO();
				h.setLat(rs.getString("lat"));
				h.setLng(rs.getString("lng"));
				list.add(h);
			}
			
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		} finally {
			if(rs != null) {try{rs.close();} catch(SQLException e){}}
			if(pstmt != null) {try{pstmt.close();} catch(SQLException e){}}
			if(conn != null) {try{conn.close();} catch(SQLException e){}}
		}
		
		return list;
	}
	
	// 추천 매물(조회순으로 정렬) 불러오기 메소드
	public ArrayList<RecommendVO> findByHit(){
		ArrayList<RecommendVO> list = new ArrayList<RecommendVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select h.house_no, house_name, deposit, type, deal_type, floor, price, area, lat, lng, state, img_fname "
				+ "from house h, img i where h.house_no=i.house_no "
				+ "and img_no in (select min(img_no) from img group by house_no) order by hit desc";
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommendVO r = new RecommendVO();
				r.setHouse_no(rs.getInt("house_no"));
				r.setHouse_name(rs.getString("house_name"));
				r.setDeposit(rs.getInt("deposit"));
				r.setType(rs.getString("type"));
				r.setDeal_type(rs.getString("deal_type"));
				r.setFloor(rs.getInt("floor"));
				r.setPrice(rs.getInt("price"));
				r.setArea(rs.getInt("area"));
				r.setState(rs.getString("state"));
				r.setLat(rs.getString("lat"));
				r.setLng(rs.getString("lng"));
				r.setImg_fname(rs.getString("img_fname"));
				list.add(r);
			}
			
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		} finally {
			if(rs != null) {try{rs.close();} catch(SQLException e){}}
			if(pstmt != null) {try{pstmt.close();} catch(SQLException e){}}
			if(conn != null) {try{conn.close();} catch(SQLException e){}}
		}
		
		return list;
	}
	
	// 매물 검색 메소드 (지도에서 검색)
	public ArrayList<RecommendVO> searchHouse(String searchWord){
		ArrayList<RecommendVO> list = new ArrayList<RecommendVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select h.house_no, house_name, deposit, type, deal_type, floor, price, area, lat, lng, state, img_fname "
				+ "from house h, img i where h.house_no=i.house_no "
				+ "and img_no in (select min(img_no) from img group by house_no) ";
		
		if(searchWord != null && !(searchWord.equals(""))){
			sql += "and loc like '%"+searchWord+"%' order by hit desc";
		}
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommendVO r = new RecommendVO();
				r.setHouse_no(rs.getInt("house_no"));
				r.setHouse_name(rs.getString("house_name"));
				r.setDeposit(rs.getInt("deposit"));
				r.setType(rs.getString("type"));
				r.setDeal_type(rs.getString("deal_type"));
				r.setFloor(rs.getInt("floor"));
				r.setPrice(rs.getInt("price"));
				r.setArea(rs.getInt("area"));
				r.setState(rs.getString("state"));
				r.setLat(rs.getString("lat"));
				r.setLng(rs.getString("lng"));
				r.setImg_fname(rs.getString("img_fname"));
				list.add(r);
			}
			
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		} finally {
			if(rs != null) {try{rs.close();} catch(SQLException e){}}
			if(pstmt != null) {try{pstmt.close();} catch(SQLException e){}}
			if(conn != null) {try{conn.close();} catch(SQLException e){}}
		}
		
		return list;
	}
	
	// 매물 검색 메소드 (메인->지도)
	public ArrayList<RecommendVO> findAll(String searchCol){
		ArrayList<RecommendVO> list = new ArrayList<RecommendVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select h.house_no, house_name, deposit, type, deal_type, floor, price, area, state, img_fname "
				+ "from house h, img i where h.house_no=i.house_no "
				+ "and img_no in (select min(img_no) from img group by house_no) ";
		
		if(searchCol != null && !(searchCol.equals(""))){
			sql += "and type = '"+searchCol+"' order by hit desc";
		}
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommendVO r = new RecommendVO();
				r.setHouse_no(rs.getInt("house_no"));
				r.setHouse_name(rs.getString("house_name"));
				r.setDeposit(rs.getInt("deposit"));
				r.setType(rs.getString("type"));
				r.setDeal_type(rs.getString("deal_type"));
				r.setFloor(rs.getInt("floor"));
				r.setPrice(rs.getInt("price"));
				r.setArea(rs.getInt("area"));
				r.setState(rs.getString("state"));
				r.setImg_fname(rs.getString("img_fname"));
				list.add(r);
			}
			
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		} finally {
			if(rs != null) {try{rs.close();} catch(SQLException e){}}
			if(pstmt != null) {try{pstmt.close();} catch(SQLException e){}}
			if(conn != null) {try{conn.close();} catch(SQLException e){}}
		}
		
		return list;
	}
	
	
}
