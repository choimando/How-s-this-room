package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.HouseDAO;
import com.sist.vo.HouseVO;

public class LoadHouseAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HouseDAO dao = HouseDAO.getInstance();
		String searchCol = null;
		ArrayList<HouseVO> list = dao.findAll(searchCol);
		request.setAttribute("list", list);
		
		return "houseList.jsp";
	}

}
