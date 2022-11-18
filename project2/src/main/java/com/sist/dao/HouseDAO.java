package com.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.HouseVO;
import com.sist.vo.SecurityVO;

public class HouseDAO {
	private static HouseDAO dao;
	
	public static HouseDAO getInstance() {
		if(dao == null) {
			dao = new HouseDAO();
		}
		return dao;
	}
	
	private HouseDAO() {
		
	}
	
	public ArrayList<HouseVO> findByNo(int house_no){
		ArrayList<HouseVO> list = new ArrayList<HouseVO>();
		String sql = "select * from house where house_no ="+house_no;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				HouseVO h = new HouseVO();
				h.setArea(rs.getInt("area"));
				h.setAspect(rs.getString("aspect"));
				h.setDeal_type(rs.getString("deal_type"));
				h.setDeposit(rs.getInt("deposit"));
				h.setDetail(rs.getString("detail"));
				h.setFloor(rs.getInt("floor"));
				h.setHit(rs.getInt("hit"));
				h.setHouse_name(rs.getString("house_name"));
				h.setHouse_no(house_no);
				h.setHouse_regdate(rs.getDate("house_regdate"));
				h.setId(rs.getString("id"));
				h.setInput_date(rs.getDate("input_date"));
				h.setLat(rs.getString("lat"));
				h.setLng(rs.getString("lng"));
				h.setLoc(rs.getString("loc"));
				h.setMgr(rs.getInt("mgr"));
				h.setPrice(rs.getInt("price"));
				h.setState(rs.getString("state"));
				h.setType(rs.getString("type"));
				list.add(h);
			}
		} catch (Exception e) {
			System.out.println("예외발생 : "+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
}
