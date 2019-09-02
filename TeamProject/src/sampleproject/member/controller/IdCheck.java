package sampleproject.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;


@WebServlet("/idcheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public IdCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		MemberDAO mDAO = MemberDAO.getInstance();
		int row = mDAO.checkID(userid);
		request.setAttribute("row", row);
		request.setAttribute("userid", userid);
		RequestDispatcher rd = request.getRequestDispatcher("Member/id_check.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		MemberDAO mDAO = MemberDAO.getInstance();
		int row = mDAO.checkID(userid);
		request.setAttribute("row", row);
		request.setAttribute("userid", userid);
		RequestDispatcher rd = request.getRequestDispatcher("Member/id_check.jsp");
		rd.forward(request, response);
	}

}
