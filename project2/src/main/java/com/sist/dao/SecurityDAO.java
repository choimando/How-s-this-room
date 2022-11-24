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
import com.sist.vo.SecurityVO;

public class SecurityDAO {
	public static SecurityDAO dao;
	
	private SecurityDAO getInstance(){
		if(dao == null) {
			dao = new SecurityDAO();
		}
		return dao;
	}
	
	private ArrayList<SecurityVO> findByHouseNo(int house_no){
		ArrayList<SecurityVO> list = new ArrayList<SecurityVO>();
		String sql = "select * from security where house_no = "+house_no;
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
				SecurityVO s = new SecurityVO();
				s.setHouse_no(house_no);
				s.setCctv(rs.getString("cctv"));
				s.setFirealarm(rs.getString("firealarm"));
				s.setFrontdoor(rs.getString("frontdoor"));
				s.setInterphone(rs.getString("interphone"));
				s.setVideophone(rs.getString("videophone"));
				list.add(s);
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
