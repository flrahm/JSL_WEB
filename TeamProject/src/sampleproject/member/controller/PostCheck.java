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
import sampleproject.member.vo.ZipVO;



@WebServlet("/postcheck.do")
public class PostCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public PostCheck() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("Member/post_check.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dong = request.getParameter("addr");
		MemberDAO mDAO = MemberDAO.getInstance();
		List<ZipVO> zList = mDAO.findZip(dong);
		String addr = "";
		for(int i = 0 ; i < zList.size(); i ++) {
			addr = zList.get(i).getSido() + zList.get(i).getGugun() + zList.get(i).getDong() + zList.get(i).getBunji();
			
		}

		request.setAttribute("zList", zList);
		request.setAttribute("addr", addr);
		RequestDispatcher rd = request.getRequestDispatcher("Member/post_check.jsp?addr="+addr);
		rd.forward(request, response);
	}


}
