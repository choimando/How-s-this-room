package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.vo.InsertHouseVO;

import com.sist.dao.InsertHouseDAO;

public class InsertHouseAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InsertHouseDAO dao = InsertHouseDAO.getInstance();
		int house_no = dao.insertHouse(null);
		request.setAttribute("house_no", house_no);
		
		return "insertHouse.jsp";
	}
}
