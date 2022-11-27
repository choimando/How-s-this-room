package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.HouseDAO;
import com.sist.dao.ImgDAO;
import com.sist.dao.MgrDAO;
import com.sist.dao.OptDAO;
import com.sist.dao.SecurityDAO;

public class DeleteHouseAction implements ProjectAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int house_no = Integer.parseInt(request.getParameter("house_no"));
		OptDAO opt_dao = OptDAO.getInstance();
		MgrDAO mgr_dao = MgrDAO.getInstance();
		SecurityDAO seq_dao = SecurityDAO.getInstance();
		ImgDAO img_dao = ImgDAO.getInstance();
		HouseDAO house_dao = HouseDAO.getInstance();
		opt_dao.deleteOPT(house_no);
		mgr_dao.deleteMgr(house_no);
		seq_dao.deleteSecurity(house_no);
		img_dao.deleteImg(house_no);
		int re = house_dao.deleteHouse(house_no);
		String result = "";
		if(re >=1) {
			result = "houseList.jsp";
		}else {
			result = "main.jsp";
		}
		
		return result;
	}

}
