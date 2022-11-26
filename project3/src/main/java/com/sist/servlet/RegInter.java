package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.AlarmDAO;
import com.sist.dao.InterestDAO;
import com.sist.vo.AlarmVO;
import com.sist.vo.InterestVO;

/**
 * Servlet implementation class RegInter
 */
@WebServlet("/RegInter")
public class RegInter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegInter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //관심목록에 등록하는 서블릿
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		InterestVO i = new InterestVO();
		i.setHouse_id(request.getParameter("house_id2"));
		i.setHouse_no(Integer.parseInt(request.getParameter("house_no2")));
		i.setId(request.getParameter("id"));
		i.setInter_img(request.getParameter("inter_img"));
		i.setInter_title(request.getParameter("inter_title"));
		InterestDAO dao = InterestDAO.getInstance();
		int re = dao.insertInter(i);
		*/
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		
		String house_id = "kim"; //request.getParameter("house_id2");
		int house_no = 1; //Integer.parseInt(request.getParameter("house_no2"));
		
		AlarmVO a = new AlarmVO();
		a.setHouse_no(house_no);
		a.setId(house_id);
		AlarmDAO al_dao = AlarmDAO.getInstance();
		int re1 = al_dao.insertAlarm_inter(a);
		System.out.println(a);
		out.print(re1);
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getParameter("utf-8");
		doGet(request, response);
	}

}
