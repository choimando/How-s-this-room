package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.InsertHouseDAO;
import com.sist.vo.InsertHouseVO;

/**
 * Servlet implementation class InsertHouseServlet
 */
@WebServlet("/insertHouse")
public class InsertHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InsertHouseVO i = new InsertHouseVO();
		i.setHouse_no(Integer.parseInt(request.getParameter("house_no")) );
		
		InsertHouseDAO dao = new InsertHouseDAO();
		int re = dao.insertHouse(i);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(re);
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
