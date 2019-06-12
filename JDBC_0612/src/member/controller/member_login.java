package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.vo.MemberVO;

/**
 * Servlet implementation class member_login
 */
@WebServlet("/userlogin.do")
public class member_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/JDBC_0612/Member/userlogin_form.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String inputID = request.getParameter("userid");
		String inputPW = request.getParameter("passwd");
		
		MemberDAO mdao = MemberDAO.getInstance();
		int flag = mdao.userLogin(inputID, inputPW);
		
		
		if(flag == 1) {
			MemberVO mvo = mdao.selectMemberById(inputID);
			HttpSession session = request.getSession();
			session.setAttribute("loginID", mvo.getUserid());
			session.setAttribute("loginIdx", mvo.getIdx());
			session.setAttribute("loginName", mvo.getName());
			response.sendRedirect("/JDBC_0612/Member/userlogin_ok.jsp");
		}else {
			
			response.sendRedirect("/JDBC_0612/Member/userlogin_form.jsp?flag=" + flag);
		}
		
		
	}

}
