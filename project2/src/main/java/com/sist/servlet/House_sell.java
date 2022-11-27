package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.AlarmDAO;
import com.sist.dao.HouseDAO;
import com.sist.dao.InterestDAO;
import com.sist.vo.InterestVO;

/**
 * Servlet implementation class House_sell
 */
@WebServlet("/House_sell")
public class House_sell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public House_sell() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //집이 판매되었을 때 상태를 바꾸는 서블릿
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int house_no = Integer.parseInt(request.getParameter("house_no"));
		HouseDAO dao = HouseDAO.getInstance();
		int re = dao.updateHouse(house_no);
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(re);
		
		/*
		InterestDAO inter_dao = InterestDAO.getInstance();
		ArrayList<InterestVO> list = inter_dao.getId(house_no);
		AlarmDAO al_dao = AlarmDAO.getInstance();
		*/
		
		
		
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
