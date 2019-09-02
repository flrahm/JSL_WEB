package sampleproject.admin.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;
import sampleproject.member.vo.MemberVO;

@WebServlet("/adminmemberview.do")
public class AdminMemberView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO vo = dao.memberView(idx);
		request.setAttribute("vo", vo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/member_view.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
