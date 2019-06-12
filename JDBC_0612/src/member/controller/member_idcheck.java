package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;

/**
 * Servlet implementation class member_idcheck
 */
@WebServlet("/id_check.do")
public class member_idcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member_idcheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/JDBC_0612/Member/id_check.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		MemberDAO mdao = MemberDAO.getInstance();
		String inputID = request.getParameter("userid");
		boolean idDuple = mdao.userIdDuplication(inputID);
		
		if(idDuple) {
			request.setAttribute("flag", "0");	
		}else {
			request.setAttribute("flag", "1");
		}	
		
		request.setAttribute("userid", inputID);
		RequestDispatcher rd = request.getRequestDispatcher("/Member/id_check.jsp");
		rd.forward(request, response);
	}

}
