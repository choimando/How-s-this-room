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

import com.sist.vo.ImgVO;
import com.sist.vo.OptVO;

public class ImgDAO {
	private static ImgDAO dao;
	
	private ImgDAO() {
		
	}
	
	public static ImgDAO getInstance() {
		if(dao == null) {
			dao = new ImgDAO();
		}
		return dao;
	}
	// house삭제 되기전 이미지 삭제하는 메소드
	public int deleteImg(int house_no) {
		int re = -1;
		String sql = "delete img where house_no =" + house_no;
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
	
	//house_no로 이미지 정보 불러오는 메소드
	public ArrayList<ImgVO> findByNo(int house_no){
		ArrayList<ImgVO> list = new ArrayList<ImgVO>();
		String sql = "select * from img where house_no ="+house_no;
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
				ImgVO i = new ImgVO();
				i.setHouse_no(house_no);
				i.setImg_fname(rs.getString("img_fname"));
				i.setImg_no(rs.getInt("img_no"));
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
	public int insertImg(ImgVO img) {
		int re = -1;
		String sql = "insert into img(img_no,img_fname,house_no) values(?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, img.getImg_no());
			pstmt.setString(2, img.getImg_fname());
			pstmt.setInt(3, img.getHouse_no());
			re = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());;
		}finally {
			if(pstmt !=null ) { try {pstmt.close();} catch(Exception e) {} }
			if(conn !=null ) { try {conn.close();} catch(Exception e) {} }
		}
		return re;
	}
	
	private ArrayList<ImgVO> findByHouseNo(int house_no){
		ArrayList<ImgVO> list = new ArrayList<ImgVO>();
		String sql = "select * from img where house_no ="+house_no;
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
				ImgVO i = new ImgVO();
				i.setHouse_no(house_no);
				i.setImg_fname(rs.getString("img_fname"));
				i.setImg_no(rs.getInt("img_no"));
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

