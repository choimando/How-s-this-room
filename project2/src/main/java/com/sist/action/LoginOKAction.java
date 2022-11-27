package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class LoginOKAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDAO dao = MemberDAO.getInstance();
		int re = dao.loginCheck(id, pwd);
		request.setAttribute("re", re);
		request.setAttribute("id", id);		
		return "loginOK.jsp";
	}

}