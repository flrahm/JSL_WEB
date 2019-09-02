package com.library.action.booklend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.dao.DAO_Booklend;
import com.library.vo.VO_BookList;
import com.library.vo.VO_Booklend;

public class Action_Booklend_renewal implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lendno = request.getParameter("lendno");
		DAO_Booklend lend_dao = DAO_Booklend.getInstance();
		String lenddue = lend_dao.booklend_renewal(lendno); // 대출 번호로 대출예정일 +7 한 날짜 구하기
		int row = lend_dao.booklend_renewal_update(lendno, lenddue); // 연장된 날짜로 수정
		VO_Booklend lend_vo = null;
		if(row == 1) {
			lend_vo = new VO_Booklend();
			lend_vo.setRenewal("1");
		}
		HttpSession session = request.getSession();
		String memberid = (String) session.getAttribute("session");
		
		DAO_Booklend dao = DAO_Booklend.getInstance();
		List<VO_Booklend> list = dao.booklend_list(memberid);
		DAO_BookList list_dao = DAO_BookList.getInstance();
		List<VO_BookList> best_list = list_dao.booklistBestsellers();
		
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		JSONObject obj = new JSONObject();
		obj.put("row", row);
		obj.put("insertok", 2);
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();
		
		
		/*
		 * request.setAttribute("lend_vo", lend_vo); request.setAttribute("best_list",
		 * best_list); request.setAttribute("list", list); RequestDispatcher rd =
		 * request.getRequestDispatcher("booklend/booklend_list.jsp");
		 * rd.forward(request, response);
		 */
	}

}
