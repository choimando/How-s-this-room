package com.sist.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.OptVO;

public class OptDAO {
	public static OptDAO dao;
	public static OptDAO getInstance() {
		if(dao == null) {
			dao = new OptDAO();
		}
		return dao;
	}
	
	private OptDAO() {		
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
				o.setOt_micro(rs.getString("opt_micro"));
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
