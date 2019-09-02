package sampleproject.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;
import sampleproject.member.vo.SampleVO;



@WebServlet("/userinfolist.do")
public class UserinfoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UserinfoList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDAO = MemberDAO.getInstance();
		List<SampleVO> sList = mDAO.sList();
		request.setAttribute("sList", sList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Member/userinfo_list.jsp");
		rd.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDAO = MemberDAO.getInstance();
		List<SampleVO> sList = mDAO.sList();
		
		request.setAttribute("sList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("Member/userinfo_list.jsp");
		rd.forward(request, response);
	
	}

}
