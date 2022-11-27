

package com.sist.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sist.dao.InsertHouseDAO;
import com.sist.vo.InsertHouseVO;

public class InsertHouseOKAction implements ProjectAction {
	//입력한 값 받도록 받아오도록 해야 값이 받아짐
	
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		return "insertHouseOK.jsp";
	}

}