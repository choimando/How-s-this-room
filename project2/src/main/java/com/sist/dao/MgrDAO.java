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

import com.sist.vo.InsertHouseVO;
import com.sist.vo.MgrVO;

public class MgrDAO {
	private static MgrDAO dao;
	public static MgrDAO getInstance() {
		if(dao==null) {
			dao = new MgrDAO();
		}
		return dao;
	}
	private MgrDAO() {
	}
	
	public int insertMgr(MgrVO m) {
		
		//insert into mgr(house_no,mgr_elec,mgr_water,mgr_internet,mgr_gas,mgr_park) values(seq_house_no.nextval,?,?,?,?,?)
		int re = -1;
		String sql = "insert into mgr(house_no,mgr_elec,mgr_water,mgr_internet,mgr_gas,mgr_park) values(?,?,?,?,?,?)";
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getHouse_no());
			pstmt.setString(2, m.getMgr_elec());
			pstmt.setString(3, m.getMgr_water());
			pstmt.setString(4, m.getMgr_internet());
			pstmt.setString(5, m.getMgr_gas());
			pstmt.setString(6, m.getMgr_park());
			re = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());;
		}finally {
			if(pstmt !=null ) { try {pstmt.close();} catch(Exception e) {} }
			if(conn !=null ) { try {conn.close();} catch(Exception e) {} }
		}
		return re;
	}
	
	public ArrayList<InsertHouseVO> findAll(){
		ArrayList<InsertHouseVO> list = new ArrayList<InsertHouseVO>();
		String sql = "select * from house";
		Connection conn = null;	      
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				InsertHouseVO i = new InsertHouseVO();
				i.setHouse_no(rs.getInt("house_no"));
				i.setHouse_name(rs.getString("house_name"));
				list.add(i);
			}
		}catch(Exception e){
			System.out.println("예외발생:"+e.getMessage());
		}
		finally {
			if(rs != null) {try {rs.close();} 
			catch (SQLException e) {e.printStackTrace();}}
			if(stmt != null) {try {stmt.close();} 
			catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} 
			catch (SQLException e) {e.printStackTrace();}}
		}
		return list;
	}
	
	private ArrayList<MgrVO> findByHouseNo(int house_no){
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
