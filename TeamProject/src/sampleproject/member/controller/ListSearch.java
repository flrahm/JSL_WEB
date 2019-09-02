package sampleproject.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;
import sampleproject.member.vo.SampleVO;

/**
 * Servlet implementation class ListSearch
 */
@WebServlet("/ListSearch")
public class ListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDAO = MemberDAO.getInstance();
		String gubun = request.getParameter("gubun");
		String value = request.getParameter("search_name");
		System.out.println(gubun);
		System.out.println(value);
		List<SampleVO> sList = new ArrayList<SampleVO>();
		int search = 1;
	
		if(gubun.equalsIgnoreCase("name")) {
			
			 sList = mDAO.searchByName(value);
		}else {
			
			sList = mDAO.searchByAddr(value);	
		}
		request.setAttribute("search", search);
		request.setAttribute("mList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("userinfolist.do");
		rd.forward(request, response);
		
		
	}

}
