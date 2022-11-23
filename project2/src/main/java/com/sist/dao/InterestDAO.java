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

import com.sist.vo.AlarmVO;
import com.sist.vo.InterestVO;

public class InterestDAO {
	public static InterestDAO dao;
	
	public static InterestDAO getInstance() {
		if(dao == null) {
			dao = new InterestDAO();
		}
		return dao;
	}
	
	private InterestDAO() {
		
	}
	// 관심목록에 등록하는 메소드
	public int insertInter(InterestVO i) {
		int re = -1;
		String sql ="insert into interest(inter_no, inter_title, inter_img, id, house_id, house_no) values(seq_inter.nextval, ?, ?, ?, ?, ? )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getInter_title());
			pstmt.setString(2, i.getInter_img());
			pstmt.setString(3, i.getId());
			pstmt.setString(4, i.getHouse_id());
			pstmt.setInt(5, i.getHouse_no());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생 : "+e.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
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
	// 해당 글을 관심목록에 등록한 사람의 아이디를 가져오는 메소드
	public ArrayList<InterestVO> getId(int house_no){
		ArrayList<InterestVO> list = new ArrayList<InterestVO>();
		String sql = "select id, house_no from interest where house_no ="+house_no;
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
				InterestVO i = new InterestVO();
				i.setHouse_id(rs.getString("id"));
				i.setHouse_no(rs.getInt("house_no"));
				list.add(i);
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
