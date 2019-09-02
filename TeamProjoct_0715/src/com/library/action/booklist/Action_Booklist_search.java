package com.library.action.booklist;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.util.PageIndex;
import com.library.vo.VO_BookList;

public class Action_Booklist_search implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String key = request.getParameter("key");
		String url = "booklist?cmd=booklist";
		String addtag = "&search=" + search + "&key=" + key;
		int nowpage = 1;
		if (request.getParameter("nowpage") != null) {
			nowpage = Integer.parseInt(request.getParameter("nowpage"));
		}
		int maxlist = 10;
		int totpage = 1;
		DAO_BookList dao = DAO_BookList.getInstance();
		int totcount = dao.booklistSearchCount(search, key); // 총 글수

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
		List<VO_BookList> list = dao.booklist_search_list(search, key, pagestart, endpage);
		List<VO_BookList> best_list = dao.booklistBestsellers();
		request.setAttribute("best_list", best_list);
		request.setAttribute("totcount", totcount);
		request.setAttribute("nowpage", nowpage);
		request.setAttribute("totpage", totpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("list", list);
		request.setAttribute("url", url);
		request.setAttribute("addtag", addtag);
		// 페이지 스킵 처리
		String pageSkip = PageIndex.pageList(nowpage, totpage, url, addtag);
		request.setAttribute("pageSkip", pageSkip);
		RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_index.jsp");
		rd.forward(request, response);
	}
}