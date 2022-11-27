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

import com.sist.vo.HouseVO;
import com.sist.vo.RecomentVO;

public class RecomentDAO {
	public static RecomentDAO dao;
	
	
	private RecomentDAO() {
		
	}
	
	public static RecomentDAO getInstance() {
		if(dao == null) {
			dao = new RecomentDAO();
		}
		return dao;
	}
	
	//게시글에 댓글 등록하는 메소드
	public int insertRecoment(RecomentVO r) {
		int re = -1;
		String sql = "insert into recoment(reno, re_content, re_pwd, house_no) values(seq_recoment.nextval,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRe_content());
			pstmt.setString(2, r.getRe_pwd());
			pstmt.setInt(3, r.getHouse_no());
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
	
	//게시글에 대한 댓글을 불러오는 메소드
	public ArrayList<RecomentVO> findByNo(int house_no){
		ArrayList<RecomentVO> list = new ArrayList<RecomentVO>();
		String sql = "select * from recoment where house_no ="+ house_no;
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
				RecomentVO r = new RecomentVO();
				r.setHouse_no(house_no);
				r.setRe_content(rs.getString("re_content"));
				r.setRe_pwd(rs.getString("re_pwd"));
				r.setReno(rs.getInt("reno"));
				list.add(r);
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
	
	//댓글을 삭제하는 메소드
	public int deleteRecoment(int reno) {
		int re = -1;
		String sql = "delete recoment where reno ="+reno;
		Connection conn = null;
		Statement stmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
		}catch (Exception e) {
			// TODO: handle exception
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
}
