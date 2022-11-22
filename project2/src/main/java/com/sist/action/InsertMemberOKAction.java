package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class InsertMemberOKAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO m = new MemberVO();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String jumin = jumin1+"-"+jumin2;
		String m_addr = request.getParameter("m_addr");
		String email = request.getParameter("email");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1+"-"+phone2+"-"+phone3;
		m.setId(id);
		m.setName(name);
		m.setPwd(pwd);
		m.setJumin(jumin);
		m.setM_addr(m_addr);
		m.setEmail(email);
		m.setPhone(phone);
		
		MemberDAO dao = MemberDAO.getInstance();
		int re = dao.insertMember(m);
		String msg = "회원등록에 성공하였습니다.";
		if(re <= 0) {
			msg = "회원등록에 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		return "insertMemberOK.jsp";
	}

}
