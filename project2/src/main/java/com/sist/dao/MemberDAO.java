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

import com.sist.vo.MemberVO;

public class MemberDAO {
	private static MemberDAO dao;
	private MemberDAO() {
		
	}
	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	// 게시글 작성자의 전화번호를 가져오는 메소드
	public ArrayList<MemberVO> getPhone(String id) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "select phone from member where id = '"+id+"'";
		Connection conn =null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				MemberVO m = new MemberVO();
				m.setPhone(rs.getString(1));
				list.add(m);
			}
		} catch (Exception e) {
			
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
	public int insertMember(MemberVO m) {
		int re = -1;
		String sql = "insert into member(id,name,pwd,jumin,m_addr,email,phone) values(?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getPwd());
			pstmt.setString(4, m.getJumin());
			pstmt.setString(5, m.getM_addr());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			re = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
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
		return re;

	}
	
	public int loginCheck(String id, String pwd) {
		String sql = "select pwd from member where id = ?";
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
			if(rs.next()) {
				if(rs.getString(1).equals(pwd)) {
					return 1; // 로그인성공
				}else {
					return 0; // 비밀번호 틀림
				}
			}
			
		}catch(Exception e){
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			if(rs != null) {try{rs.close();}catch(Exception e){}}
			if(pstmt != null) {try{pstmt.close();}catch(Exception e){}}
			if(conn != null) {try{conn.close();}catch(Exception e){}}
		}
		return -2; // 오
	}
	
		public int idCheck(String id) {
			int re = 0;
			String sql="select * from member where id=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs= null;
			try {
				Context context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
				conn = ds.getConnection();
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next() || id.equals("")) {
					re = 0;	//id 있는 경우 생성 안된
				}else {
					re = 1;	// id 없는 경우 생성 됨
				}
			}catch(Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}finally {
				if(pstmt != null) {try{pstmt.close();}catch(Exception e) {}}
				if(conn != null) {try{conn.close();}catch(Exception e) {}}
			}
					
			return re;
			
		}

}
