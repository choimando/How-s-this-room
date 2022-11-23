package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.HouseDAO;
import com.sist.vo.HouseVO;
import com.sist.vo.RecommendVO;

public class SearchAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchWord = request.getParameter("searchWord");
		String searchCol = request.getParameter("searchCol");
		System.out.println("searchWord: "+searchWord);
		System.out.println("searchCol: "+searchCol);
		
		HouseDAO dao = HouseDAO.getInstance();
		ArrayList<RecommendVO> list = dao.findAll(searchCol);
		request.setAttribute("list", list);
		
		return "houseList.jsp";
	}

}
