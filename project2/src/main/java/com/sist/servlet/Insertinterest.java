package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.InterestDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.InterestVO;
import com.sist.vo.MemberVO;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/Insertinterest")
public class Insertinterest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insertinterest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inter_title = request.getParameter("inter_title");
		String inter_img = request.getParameter("inter_img");
		String id = request.getParameter("id");
		String house_id = request.getParameter("house_id");
		int house_no = Integer.parseInt(request.getParameter("house_no"));
		
		
		InterestVO b = new InterestVO();
		b.setInter_title(request.getParameter("inter_title"));
		b.setInter_img(request.getParameter("inter_img"));
		b.setId(request.getParameter("id"));
		b.setHouse_id(request.getParameter("house_id"));
		b.setHouse_no(house_no);
		
		InterestDAO dao = InterestDAO.getInstance();
		int re = dao.insertInterest(b);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(re);
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
