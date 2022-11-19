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
	
	// 매물 검색 메소드
	public ArrayList<HouseVO> findAll(String searchCol){
		ArrayList<HouseVO> list = new ArrayList<HouseVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from house ";
		
		if(searchCol != null && !(searchCol.equals(""))){
			sql += "where type = '"+searchCol+"'";
		}
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HouseVO h = new HouseVO();
				h.setHouse_no(rs.getInt("house_no"));
				h.setHouse_name(rs.getString("house_name"));
				h.setDeposit(rs.getInt("deposit"));
				h.setType(rs.getString("type"));
				h.setDeal_type(rs.getString("deal_type"));
				h.setHit(rs.getInt("hit"));
				h.setFloor(rs.getInt("floor"));
				h.setPrice(rs.getInt("price"));
				h.setArea(rs.getInt("area"));
				h.setAspect(rs.getString("aspect"));
				h.setLoc(rs.getString("loc"));
				h.setDetail(rs.getString("detail"));
				h.setId(rs.getString("id"));
				h.setHouse_regdate(rs.getDate("house_regdate"));
				h.setMgr(rs.getInt("mgr"));
				h.setState(rs.getString("state"));
				h.setLat(rs.getString("lat"));
				h.setLng(rs.getString("lng"));
				h.setInput_date(rs.getDate("input_date"));
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
	
	
}
