package sampleproject.index.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;
import sampleproject.guest.dao.GuestDAO;
import sampleproject.guest.vo.GuestVO;
import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;
import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;


@WebServlet("/indexsearch.do")
public class IndexSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public IndexSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	int num = Integer.parseInt(request.getParameter("num"));
	int gubun = Integer.parseInt(request.getParameter("gubun"));

	if(gubun == 1) {

		request.setAttribute("num", num);
		RequestDispatcher rd = request.getRequestDispatcher("noticeview.do");
		rd.forward(request, response);	
		
	}else if( gubun == 2) {
		request.setAttribute("num", num);
		RequestDispatcher rd = request.getRequestDispatcher("pdsview.do");
		rd.forward(request, response);	
	}else if (gubun == 3) {
		request.setAttribute("num", num);
		RequestDispatcher rd = request.getRequestDispatcher("pdsview.do");
		rd.forward(request, response);	
	}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Post");
		String gubun = request.getParameter("gubun");
		String item = request.getParameter("item");
		String keyword = request.getParameter("mykeyword");
	
		request.setAttribute("keyword", keyword);
		
		if(gubun.equalsIgnoreCase("bo")) {
			BoardDAO bDAO = BoardDAO.getInstance();
			List<BoardVO> bList = new ArrayList<BoardVO>();
			System.out.println(item);
			System.out.println(keyword);
			bList = bDAO.boardSearch(item, keyword);
			request.setAttribute("list", bList);
			RequestDispatcher rd = request.getRequestDispatcher("Board/board_list.jsp");
			rd.forward(request, response);
			
		}else if(gubun.equalsIgnoreCase("pd")) {
			PdsDAO pDAO = PdsDAO.getInstance();
			List<PdsVO> pList = new ArrayList<PdsVO>();
			pList = pDAO.pdsSearch(item, keyword);
			request.setAttribute("list", pList);
			RequestDispatcher rd = request.getRequestDispatcher("Pds/pds_list.jsp");
			rd.forward(request, response);
			
		}else if(gubun.equalsIgnoreCase("no")) {
			NoticeDAO nDAO = NoticeDAO.getInstance();
			List<NoticeVO> nList = new ArrayList<NoticeVO>();
			nList = nDAO.noticeSearch("subject", keyword);
			request.setAttribute("list", nList);
			RequestDispatcher rd = request.getRequestDispatcher("Notice/notice_list.jsp");
			rd.forward(request, response);
			
		}else if(gubun.equalsIgnoreCase("gu")) {
			GuestDAO gDAO = GuestDAO.getInstance();
			List<GuestVO> gList = new ArrayList<GuestVO>();
			gList = gDAO.guestSearch(item, keyword);
			request.setAttribute("list", gList);
			RequestDispatcher rd = request.getRequestDispatcher("guestlist.do");
			rd.forward(request, response);
			
		}
		
		
	}
	
	

}


