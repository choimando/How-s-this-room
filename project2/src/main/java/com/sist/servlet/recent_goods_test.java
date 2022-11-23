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
import com.sist.dao.Recent_roomDAO;
import com.sist.vo.HouseVO;
import com.sist.vo.Recent_RoomVO;

/**
 * Servlet implementation class recent_goods_test
 */
@WebServlet("/recent_goods_test")
public class recent_goods_test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recent_goods_test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int house_no =Integer.parseInt(request.getParameter("house_no"));
		Recent_roomDAO dao = Recent_roomDAO.getInstance();
		ArrayList<Recent_RoomVO> list= new ArrayList<Recent_RoomVO>();
		list = dao.findByNo(house_no);
		Gson gson = new Gson();
		String str =gson.toJson(list);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
