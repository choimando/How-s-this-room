package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.MgrVO;
import com.sist.vo.OptVO;
import com.sist.vo.SecurityVO;

public class SecurityDAO {
	private static SecurityDAO dao;
	
	public static SecurityDAO getInstance(){
		if(dao == null) {
			dao = new SecurityDAO();
		}
		return dao;
	}
	private SecurityDAO() {
		
	}
	
	public int insertSecurity(SecurityVO s) {
		//insert into security(house_no,cctv,videophone,interphone,firealarm,frontdoor) values(?,?,?,?,?,?);
		//insert into mgr(house_no,mgr_elec,mgr_water,mgr_internet,mgr_gas,mgr_park) values(seq_house_no.nextval,?,?,?,?,?)
		//insert into opt(house_no,opt_park,opt_aircon,opt_refrige,opt_washer,opt_gas,opt_micro,opt_elevator,opt_builtin) values(?,?,?,?,?,?,?,?,?);
		int re = -1;
		String sql = "insert into security(house_no,cctv,videophone,interphone,firealarm,frontdoor) values(?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getHouse_no());
			pstmt.setString(2, s.getCctv());
			pstmt.setString(3, s.getViedophone());
			pstmt.setString(4, s.getInterphone());
			pstmt.setString(5, s.getFirealarm());
			pstmt.setString(6, s.getFrontdoor());
					
			re = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());;
		}finally {
			if(pstmt !=null ) { try {pstmt.close();} catch(Exception e) {} }
			if(conn !=null ) { try {conn.close();} catch(Exception e) {} }
		}
		return re;
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
				s.setViedophone(rs.getString("videophone"));
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
