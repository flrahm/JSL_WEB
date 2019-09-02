package sampleproject.admin.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;

@WebServlet("/adminmemberdelete.do")
public class AdminMemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("adminmemberdelete.do-get");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = MemberDAO.getInstance();
		int row = dao.memberDelete(idx);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminmemberlist.do");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
