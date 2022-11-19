package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.catalina.tribes.transport.DataSender;

import com.sist.vo.InsertHouseVO;
public class InsertHouseDAO {
	//insert into house (house_no,house_name,deposit,type,deal_type,hit,floor,price,area,aspect,loc,detail,id,house_regdate,input_date,state,lat,lng,mgr)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)

	public int insertHouse(InsertHouseVO i) {
		int re = -1;
		String sql = "insert into house (house_no,house_name,deposit,type,deal_type,hit,floor,price,area,aspect,loc,detail,id,house_regdate,input_date,state,lat,lng,mgr)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/mydb");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i.getHouse_no());
			pstmt.setString(2, i.getHouse_name());
			pstmt.setInt(3, i.getDeposit());
			pstmt.setString(4, i.getType());
			pstmt.setString(5, i.getDeal_type());
			pstmt.setInt(6, i.getHit());
			pstmt.setInt(7, i.getFloor());
			pstmt.setInt(8, i.getPrice());
			pstmt.setInt(9, i.getArea());
			pstmt.setString(10, i.getAspect());
			pstmt.setString(11, i.getLoc());
			pstmt.setString(12, i.getDetail());
			pstmt.setString(13, i.getId());
			pstmt.setDate(14, (Date)i.getHouse_regdate());
			pstmt.setDate(15, (Date)i.getInput_date());
			pstmt.setString(16, i.getState());
			pstmt.setString(17, i.getLat());
			pstmt.setString(18, i.getLng());
			pstmt.setInt(19, i.getMgr());
			re = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());;
		}finally {
			if(pstmt !=null ) { try {pstmt.close();} catch(Exception e) {} }
			if(conn !=null ) { try {conn.close();} catch(Exception e) {} }
		}
		return re;
	}
}