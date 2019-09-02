package com.library.action.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_notice;
import com.library.util.PageIndex;
import com.library.vo.VO_Notice;

public class Action_Notice_List implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DAO_notice dao = DAO_notice.getInstance();
		int nowpage = 1;
		int maxlist = 10; // 1페이지당 표시할 글의 수
		int totpage = 1;
		String url = "notice?cmd=notice"; // board_list.do 서블렛이 실행하게 함.
		String addtag = "";

		// 총 글의 수를 소환.
		int totcount = dao.listcount();
		// 총 페이지를 계산하는 수식.
		if (totcount % maxlist == 0) {
			totpage = totcount / maxlist; // 나누어 떨어진다면 페이지수는 총 글의 수를 페이지당 글 수로 나눈 값이다.
		} else {
			totpage = totcount / maxlist + 1; // 나누어 떨어지지 않는다면 페이지 수를 +1 해줘야 남은 글의 수가 표시됨.
		}
		if (totpage == 0)
			totpage = 1;
		if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			nowpage = Integer.parseInt(request.getParameter("page"));
		}
		if (nowpage > totpage) {
			nowpage = totpage;
		}
		// 페이지 시작 번호를 설정.
		int pagestart = (nowpage - 1) * maxlist; // 페이지 시작번호 (예 0,10)
		int endpage = nowpage * maxlist; // 페이지의 끝(10,20)
		int listcount = totcount - ((nowpage - 1) * maxlist)/* + 1 */;
		List<VO_Notice> list = dao.noticeList(pagestart, endpage);
		request.setAttribute("totcount", totcount);
		request.setAttribute("url", url);
		request.setAttribute("nowpage", nowpage);
		request.setAttribute("totpage", totpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("list", list);
		// 페이지 스킵 처리
		String pageSkip = PageIndex.pageList(nowpage, totpage, url, addtag);
		request.setAttribute("pageSkip", pageSkip);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("notice/Notice.jsp");
		rd.forward(request, response);
	}
}