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

import com.sist.vo.OptVO;

public class OptDAO {
	private static OptDAO dao;
	public static OptDAO getInstance() {
		if(dao == null) {
			dao = new OptDAO();
		}
		return dao;
	}
	
	private OptDAO() {		
	}	
	//옵션 삭제하는 메소드
	public int deleteOPT(int house_no) {
		int re = -1;
		String sql = "delete opt where house_no =" + house_no;
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
	
	//해당하는 집번호의 옵션들을 불러오는 메소드
	public ArrayList<OptVO> findByNo(int house_no){
		ArrayList<OptVO> list = new ArrayList<OptVO>();
		String sql = "select house_no, opt_park, opt_aircon, opt_refrige, opt_washer, opt_gas, opt_micro, opt_elevator, opt_builtin from opt where house_no = "+house_no;
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
				OptVO o = new OptVO();
				o.setHouse_no(rs.getInt("house_no"));
				o.setOpt_aircon(rs.getString("opt_aircon"));
				o.setOpt_builtin(rs.getString("opt_builtin"));
				o.setOpt_elevator(rs.getString("opt_elevator"));
				o.setOpt_gas(rs.getString("opt_gas"));
				o.setOpt_park(rs.getString("opt_park"));
				o.setOpt_refrige(rs.getString("opt_refrige"));
				o.setOpt_washer(rs.getString("opt_washer"));
				o.setOpt_micro(rs.getString("opt_micro"));
				list.add(o);
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
	
public int insertOpt(OptVO o) {
		
		//insert into mgr(house_no,mgr_elec,mgr_water,mgr_internet,mgr_gas,mgr_park) values(seq_house_no.nextval,?,?,?,?,?)
		//insert into opt(house_no,opt_park,opt_aircon,opt_refrige,opt_washer,opt_gas,opt_micro,opt_elevator,opt_builtin) values(?,?,?,?,?,?,?,?,?);
		int re = -1;
		String sql = "insert into opt(house_no,opt_park,opt_aircon,opt_refrige,opt_washer,opt_gas,opt_micro,opt_elevator,opt_builtin) values(?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getHouse_no());
			pstmt.setString(2, o.getOpt_park());
			pstmt.setString(3, o.getOpt_aircon());
			pstmt.setString(4, o.getOpt_refrige());
			pstmt.setString(5, o.getOpt_washer());
			pstmt.setString(6, o.getOpt_gas());
			pstmt.setString(7, o.getOpt_micro());
			pstmt.setString(8, o.getOpt_elevator());
			pstmt.setString(9, o.getOpt_builtin());
			
			re = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());;
		}finally {
			if(pstmt !=null ) { try {pstmt.close();} catch(Exception e) {} }
			if(conn !=null ) { try {conn.close();} catch(Exception e) {} }
		}
		return re;
	}
	
	public ArrayList<OptVO> findByHouseNo(int house_no){
		ArrayList<OptVO> list = new ArrayList<OptVO>();
		String sql = "select house_no, opt_park, opt_aircon, opt_refrige, opt_washer, opt_gas, opt_micro, opt_elevator, opt_builtin from opt where house_no = "+house_no;
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
				OptVO o = new OptVO();
				o.setHouse_no(rs.getInt("house_no"));
				o.setOpt_aircon(rs.getString("opt_aircon"));
				o.setOpt_builtin(rs.getString("opt_builtin"));
				o.setOpt_elevator(rs.getString("opt_elevator"));
				o.setOpt_gas(rs.getString("opt_gas"));
				o.setOpt_park(rs.getString("opt_park"));
				o.setOpt_refrige(rs.getString("opt_refrige"));
				o.setOpt_washer(rs.getString("opt_washer"));
				o.setOpt_micro(rs.getString("opt_micro"));
				list.add(o);
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
