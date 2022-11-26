package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.AlarmVO;

public class AlarmDAO {
	private static AlarmDAO dao;
	
	private AlarmDAO() {
		
	}
	
	public static AlarmDAO getInstance() {
		if(dao == null) {
			dao = new AlarmDAO();
		}
		return dao;
		
	}
	//댓글 등록되었을 때 글 작성자에게 알림 보내는 메소드
	public int insertAlarm_recoment(AlarmVO a) {
		int re = -1;
		String sql = "insert into alarm(al_no, al_content, al_type, id, house_no ) values(seq_al.nextval, '게시물에 새로운 댓글이 달렸습니다.', 'recoment', ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getId());
			pstmt.setInt(2, a.getHouse_no());
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
	
	//관심목록에 담겼을 때 작성자에게 알림가는 메소드
	public int insertAlarm_inter(AlarmVO a) {
		int re = -1;
		String sql = "insert into alarm(al_no, al_content, al_type, id, house_no ) values(seq_al.nextval, '누군가 회원님의 게시물을 관심목록에 담았습니다.', 'inter', ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getId());
			pstmt.setInt(2, a.getHouse_no());
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
	
	/*
	public int insertAlarm_Sell() {
		int re = -1;
		String sql = "insert into alarm(al_no, al_content, al_type, id, house_no ) values(seq_al.nextval, '관심목록의 매물이 판매되었습니다.', 'inter', ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getId());
			pstmt.setInt(2, a.getHouse_no());
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
	*/
}

