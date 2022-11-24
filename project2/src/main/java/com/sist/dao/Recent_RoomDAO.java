package com.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.HouseVO;
import com.sist.vo.Recent_RoomVO;
import com.sist.vo.SecurityVO;


public class Recent_RoomDAO {
	//최근 본방 다오
	private static Recent_RoomDAO dao;
	public static Recent_RoomDAO getInstance() {
		if(dao == null) {
			dao = new Recent_RoomDAO();
		}
		return dao;
	}
	
	private Recent_RoomDAO() {		
	}	
	
	
	public ArrayList<Recent_RoomVO> findByNo(int house_no){
		ArrayList<Recent_RoomVO> list = new ArrayList<Recent_RoomVO>();
		String sql = "select h.house_no, house_name,img_fname,id "
				+ "from house h, img i where h.house_no=i.house_no "
				+ "and img_no in (select min(img_no) from img group by house_no) and h.house_no = " + house_no;
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
				Recent_RoomVO r = new Recent_RoomVO();
				r.setHouse_no(rs.getInt("house_no"));
				r.setImg_fname(rs.getString("img_fname"));
				r.setHouse_name(rs.getString("house_name"));
				
				list.add(r);
				
				
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