package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sist.dao.HouseDAO;
import com.sist.vo.RecommendVO;

/**
 * Servlet implementation class SearchHouse
 */
@WebServlet("/SearchHouse")
public class SearchHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHouse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchWord = request.getParameter("searchWord");
		String houseType = request.getParameter("houseType");
		String dealType = request.getParameter("dealType");
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println(searchWord);
		System.out.println(houseType);
		System.out.println(dealType);
		System.out.println(price);
		HouseDAO dao = HouseDAO.getInstance();
		ArrayList<RecommendVO> list = dao.searchHouse(searchWord,houseType,dealType,price);
		Gson gson = new Gson();
		String str = gson.toJson(list);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
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
