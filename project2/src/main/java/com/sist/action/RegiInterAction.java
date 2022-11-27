package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.InterestDAO;
import com.sist.vo.InterestVO;

public class RegiInterAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result =null;
		String id = request.getParameter("id");
		int house_no = Integer.parseInt(request.getParameter("house_no"));
		InterestVO i = new InterestVO();
		i.setHouse_id(request.getParameter("house_id2"));
		i.setHouse_no(Integer.parseInt(request.getParameter("house_no")));
		i.setId(request.getParameter("id"));
		i.setInter_img(request.getParameter("inter_img"));
		i.setInter_title(request.getParameter("inter_title"));
		InterestDAO dao = InterestDAO.getInstance();
		int re = dao.insertInter(i);
		if(re== -1) {
			result = "detailHouse.jsp?house_no="+house_no;
		}else {
			result = "interestHouse.jsp?id ="+id;
		}
		return result;
	}

}