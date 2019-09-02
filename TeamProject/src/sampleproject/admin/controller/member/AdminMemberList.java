package sampleproject.admin.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;
import sampleproject.member.vo.MemberVO;

@WebServlet("/adminmemberlist.do")
public class AdminMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getInstance();
		List<MemberVO> list = dao.memberList();
		request.setAttribute("list", list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/member_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
