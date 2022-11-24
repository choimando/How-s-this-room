package com.sist.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.websocket.Transformation;
import java.text.ParseException;

import com.oreilly.servlet.MultipartFilter;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.ImgDAO;
import com.sist.dao.InsertHouseDAO;
import com.sist.dao.MgrDAO;
import com.sist.dao.OptDAO;
import com.sist.dao.SecurityDAO;
import com.sist.vo.ImgVO;
import com.sist.vo.InsertHouseVO;
import com.sist.vo.MgrVO;
import com.sist.vo.OptVO;
import com.sist.vo.SecurityVO;

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
		response.setContentType("text/plain;charset=utf-8");
		System.out.println("insertHouse 동작함.");
		
		String path = request.getRealPath("data");
		System.out.println("path:"+path);
		
		MultipartRequest multi = new MultipartRequest(
				request,
				path, 
				1024*1024*5,
				"utf-8", 
				new DefaultFileRenamePolicy()
			);
		
		
		InsertHouseDAO dao= InsertHouseDAO.getInstance();
		
		int house_no = dao.getNextNo();
		String house_name = multi.getParameter("house_name");
		
		System.out.println("house_name:"+house_name);
		int deposit = Integer.parseInt(multi.getParameter("deposit"));
		String type = multi.getParameter("type");
		String deal_type = multi.getParameter("deal_type");
		//int hit = Integer.parseInt(request.getParameter("hit"));
		int floor = Integer.parseInt(multi.getParameter("floor"));
		int price = Integer.parseInt(multi.getParameter("price"));
		int area = Integer.parseInt(multi.getParameter("area"));
		String aspect = multi.getParameter("aspect");
		String loc = multi.getParameter("loc");
		String detail = multi.getParameter("detail");
		String id = multi.getParameter("id");
		String house_regdate = multi.getParameter("house_regdate");
		String input_date = multi.getParameter("input_date");
		
		//String state = request.getParameter("state");
		String lat = multi.getParameter("lat");
		String lng = multi.getParameter("lng");
		int mgr = Integer.parseInt(multi.getParameter("mgr"));
		
		
		String mgr_elec = multi.getParameter("mgr_elec");
		String mgr_gas = multi.getParameter("mgr_gas");
		String mgr_internet = multi.getParameter("mgr_internet");
		String mgr_park = multi.getParameter("mgr_park");
		String mgr_water = multi.getParameter("mgr_water");
		
		String opt_park = multi.getParameter("opt_park");
		String opt_aircon = multi.getParameter("opt_aircon");
		String opt_refrige = multi.getParameter("opt_refrige");
		String opt_washer = multi.getParameter("opt_washer");
		String opt_gas = multi.getParameter("opt_gas");
		String opt_micro = multi.getParameter("opt_micro");
		String opt_elevator = multi.getParameter("opt_elevator");
		String opt_builtin = multi.getParameter("opt_builtin");
				
		String cctv = multi.getParameter("cctv");	
		String videophone = multi.getParameter("videophone");	
		String interphone = multi.getParameter("interphone");	
		String frontdoor = multi.getParameter("frontdoor");	
		String firealarm = multi.getParameter("firealarm");	
		
		int img_no = Integer.parseInt(multi.getParameter("img_no"));
		
		

		File file = multi.getFile("img_fname");	
		String img_fname = file.getName();
		System.out.println("파일명:"+img_fname);
		
		InsertHouseVO i = new InsertHouseVO();
		MgrVO m = new MgrVO();
		OptVO o = new OptVO();
		SecurityVO s = new SecurityVO();
		ImgVO img = new ImgVO();
		
		img.setHouse_no(house_no);
		img.setImg_no(img_no);
		img.setImg_fname(img_fname);
		
		s.setHouse_no(house_no);
		s.setCctv(cctv);
		s.setInterphone(interphone);
		s.setViedophone(videophone);
		s.setFirealarm(firealarm);
		s.setFrontdoor(frontdoor);
		
		o.setHouse_no(house_no);
		o.setOpt_aircon(opt_aircon);
		o.setOpt_builtin(opt_builtin);
		o.setOpt_elevator(opt_elevator);
		o.setOpt_gas(opt_gas);
		o.setOpt_park(opt_park);
		o.setOpt_refrige(opt_refrige);
		o.setOpt_washer(opt_washer);
		o.setOpt_micro(opt_micro);
		
		
		m.setHouse_no(house_no);
		m.setMgr_elec(mgr_elec);
		m.setMgr_gas(mgr_gas);
		m.setMgr_internet(mgr_internet);
		m.setMgr_park(mgr_park);
		m.setMgr_water(mgr_water);
		
		
		i.setHouse_no(house_no);
		i.setHouse_name(house_name);
		i.setDeposit(deposit);
		i.setType(type);
		i.setDeal_type(deal_type);
		//i.setHit(hit);
		i.setFloor(floor);
		i.setPrice(price);
		i.setArea(area);
		i.setAspect(aspect);
		i.setLoc(loc);
		i.setDetail(detail);
		i.setId(id);
		i.setHouse_regdate(house_regdate);
		i.setInput_date(input_date);
		//i.setState(state);
		i.setLat(lat);
		i.setLng(lng);
		i.setMgr(mgr);
		
		MgrDAO dao_mgr = MgrDAO.getInstance();
		OptDAO dao_opt = OptDAO.getInstance();
		SecurityDAO dao_sec = SecurityDAO.getInstance();
		ImgDAO dao_img = ImgDAO.getInstance();
		
		int re_house = dao.insertHouse(i);
		int re_mgr =dao_mgr.insertMgr(m);
		int re_opt = dao_opt.insertOpt(o);
		int re_security = dao_sec.insertSecurity(s);
		int re_img = dao_img.insertImg(img);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(re_house);
		out.print(re_mgr);
		out.print(re_opt);
		out.print(re_security);
		out.print(re_img);
		out.close();
		}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
