package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.AlarmDAO;
import com.sist.dao.RecomentDAO;
import com.sist.vo.AlarmVO;
import com.sist.vo.RecomentVO;

/**
 * Servlet implementation class InsertRecoment
 */
@WebServlet("/InsertRecoment")
public class InsertRecoment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRecoment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //댓글을 등록하는 서블릿
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int house_no = Integer.parseInt(request.getParameter("house_no"));
		String re_content = request.getParameter("re_content");
		String re_pwd = request.getParameter("re_pwd");
		RecomentVO r = new RecomentVO();
		r.setHouse_no(house_no);
		r.setRe_content(re_content);
		r.setRe_pwd(re_pwd);
		RecomentDAO dao = RecomentDAO.getInstance();
		int re = dao.insertRecoment(r);
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		
		
		
		String house_id = request.getParameter("house_id");
		
		AlarmVO a = new AlarmVO();
		a.setHouse_no(house_no);
		a.setId(house_id);
		AlarmDAO al_dao = AlarmDAO.getInstance();
		int re1 = al_dao.insertAlarm_recoment(a);
		
		
		out.print(re1);
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
