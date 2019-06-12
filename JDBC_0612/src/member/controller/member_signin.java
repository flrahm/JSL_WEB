package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.vo.MemberVO;

/**
 * Servlet implementation class member_signin
 */
@WebServlet("/userinfo_insert.do")
public class member_signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member_signin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/JDBC_0612/Member/userinfo_insert.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberVO mvo = new MemberVO();
		mvo.setName(request.getParameter("name"));
		mvo.setUserid(request.getParameter("userid"));
		mvo.setPasswd(request.getParameter("passwd"));
		mvo.setZipcode(request.getParameter("zipcode"));
		mvo.setAddr1(request.getParameter("addr1"));
		mvo.setAddr2(request.getParameter("addr2"));
		mvo.setTel(request.getParameter("tel"));
		mvo.setEmail(request.getParameter("email"));
		mvo.setJob(request.getParameter("job"));
		
		String[] fa = request.getParameterValues("fa");
		String favorite = "";
		if(fa != null)
			for(int i = 0; i < fa.length ; i++){
				favorite += fa[i];
				if(i != fa.length-1)
					favorite += ",";
			}
		mvo.setFavorite(favorite);
		
		MemberDAO mdao = MemberDAO.getInstance();
		mdao.insertBoard(mvo);
		response.sendRedirect("userinfo_list.do");
		
	}

}
