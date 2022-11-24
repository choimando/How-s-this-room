package com.sist.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.catalina.tribes.transport.DataSender;

import com.sist.vo.InsertHouseVO;
public class InsertHouseDAO {
private static InsertHouseDAO dao;
	
	public static InsertHouseDAO getInstance() {
		if(dao ==null) {
			dao = new InsertHouseDAO();
		}
		return dao;
	}
	private InsertHouseDAO() {
		
	}
	
	//내방보기 dao
	//select h.house_no, house_name, deposit, type, deal_type, floor, price, area, state, img_fname from house h, img i where h.house_no=i.house_no and img_no in (select min(img_no) from img group by house_no) 
	public InsertHouseVO findById(String id){
		InsertHouseVO i_vo = null;
		String sql = "select * from house where id=?";
		Connection conn = null;	      
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InsertHouseVO i = new InsertHouseVO();
				i.setId(rs.getString("id"));
			}
		}catch(Exception e){
			System.out.println("예외발생:"+e.getMessage());
		}
		finally {
			if(rs != null) {try {rs.close();} 
			catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} 
			catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} 
			catch (SQLException e) {e.printStackTrace();}}
		}
		
		return i_vo;
	}
	//insert into house (house_no,house_name,deposit,type,deal_type,hit,floor,price,area,aspect,loc,detail,id,house_regdate,input_date,state,lat,lng,mgr)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)

	//새로운 매물번호를 발행 해 주는 메소드를 정의
		public int getNextNo() {
			int house_no = 0;
			String sql = "select nvl(max(house_no),0)+1 from house";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				Context context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);		
				rs = pstmt.executeQuery();
				if(rs.next()) {
					house_no = rs.getInt(1);
				}
			}catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}finally {
				if(rs != null) {try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
				if(pstmt != null) {try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
				if(conn != null) {try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
			}
			
			
			return house_no;
		}
	//house테이블 정보 입력하는 메소드
	public int insertHouse(InsertHouseVO i) {
		int re = -1;
		String sql = "insert into house (house_no,house_name,deposit,type,deal_type,floor,price,area,aspect,loc,detail,id,house_regdate,input_date,lat,lng,mgr) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i.getHouse_no());
			pstmt.setString(2, i.getHouse_name());
			pstmt.setInt(3, i.getDeposit());
			pstmt.setString(4, i.getType());
			pstmt.setString(5, i.getDeal_type());
			//pstmt.setInt(6, i.getHit());
			pstmt.setInt(6, i.getFloor());
			pstmt.setInt(7, i.getPrice());
			pstmt.setInt(8, i.getArea());
			pstmt.setString(9, i.getAspect());
			pstmt.setString(10, i.getLoc());
			pstmt.setString(11, i.getDetail());
			pstmt.setString(12, i.getId());
			pstmt.setString(13, i.getHouse_regdate());
			pstmt.setString(14, i.getInput_date());
			//pstmt.setString(14, i.getState());
			pstmt.setString(15, i.getLat());
			pstmt.setString(16, i.getLng());
			pstmt.setInt(17, i.getMgr());
			re = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());;
		}finally {
			if(pstmt !=null ) { try {pstmt.close();} catch(Exception e) {} }
			if(conn !=null ) { try {conn.close();} catch(Exception e) {} }
		}
		return re;
	}
	//모든 house정보를 나타내는 메소드(필요없음)
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
				i.setDeposit(rs.getInt("deposit"));
				i.setLat(rs.getString("lat"));
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
}