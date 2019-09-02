package com.library.action.booklist;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.util.PageIndex;
import com.library.vo.VO_BookList;

public class Action_Booklist_list implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_BookList dao = DAO_BookList.getInstance();
		HttpSession session = request.getSession(); // session
		String url = "booklist?cmd=booklist";
		String addtag = "";
		int nowpage = 1;
		if (request.getParameter("nowpage") != null) {
			nowpage = Integer.parseInt(request.getParameter("nowpage"));
		}
		int maxlist = 10; // 페이지당 글 수
		int totpage = 1;
		int totcount = dao.booklistCount(); // 총 글수
		// 총 페이지 수 계산
		if (totcount % maxlist == 0) {
			totpage = totcount / maxlist;
		} else {
			totpage = totcount / maxlist + 1;
		}
		if (totpage == 0) {
			totpage = 1;
		}
		if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			nowpage = Integer.parseInt(request.getParameter("page"));
		}
		if (nowpage > totpage) {
			nowpage = totpage;
		}
		// 페이지 시작번호
		int pagestart = (nowpage - 1) * maxlist; // 페이지 시작번호
		int endpage = nowpage * maxlist; // 페이지 끝
		int listcount = totcount - ((nowpage - 1) * maxlist);
		List<VO_BookList> list = dao.booklist_method(pagestart, endpage);
		String memberid = (String) session.getAttribute("session");
		// bestsellers
		List<VO_BookList> best_list = dao.booklistBestsellers();
		session.setAttribute("session", memberid); // session
		request.setAttribute("totcount", totcount);
		request.setAttribute("addtag", addtag);
		request.setAttribute("url", url);
		request.setAttribute("nowpage", nowpage);
		request.setAttribute("totpage", totpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("list", list);
		request.setAttribute("best_list", best_list);
		// 페이지 스킵 처리
		String pageSkip = PageIndex.pageList(nowpage, totpage, url, addtag);
		request.setAttribute("pageSkip", pageSkip);
		RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_index.jsp");
		rd.forward(request, response);
	}
}