package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.ZipSampleDAO;
import member.vo.ZipSampleVO;

/**
 * Servlet implementation class member_postcheck
 */
@WebServlet("/post_check.do")
public class member_postcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member_postcheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/JDBC_0612/Member/post_check.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String addr1 = request.getParameter("addr");

		ZipSampleDAO zdao = ZipSampleDAO.getInstance();
		List<ZipSampleVO> zList = zdao.selectByAddr1(addr1);
		
		request.setAttribute("zList", zList);
		RequestDispatcher rd = request.getRequestDispatcher("/Member/post_check.jsp");
		rd.forward(request, response);
	}

}
