package com.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.MgrVO;

public class MgrDAO {
	private static MgrDAO dao;
	
	public static MgrDAO getInstance() {
		if(dao == null) {
			dao = new MgrDAO();
		}
		return dao;
	}
	
	private MgrDAO() {
		
	}
	// 관리비 삭제하는 메소드
	public int deleteMgr(int house_no) {
		int re = -1;
		String sql = "delete mgr where house_no =" + house_no;
		Connection conn = null;
		Statement stmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("예외발생 : "+ e.getMessage());
		}finally {
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
		return re;
	}
	
	//해당하는 집 번호의 관리비 항목을 찾아오는 메소드
	public ArrayList<MgrVO> findByNo(int house_no){
		ArrayList<MgrVO> list = new ArrayList<MgrVO>();
		String sql = "select * from mgr where house_no = " + house_no;
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
				MgrVO m = new MgrVO();
				m.setHouse_no(house_no);
				m.setMgr_elec(rs.getString("mgr_elec"));
				m.setMgr_gas(rs.getString("mgr_gas"));
				m.setMgr_internet(rs.getString("mgr_internet"));
				m.setMgr_park(rs.getString("mgr_park"));
				m.setMgr_water(rs.getString("mgr_water"));
				list.add(m);
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
