package sampleproject.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.member.dao.MemberDAO;
import sampleproject.member.vo.SampleVO;


@WebServlet("/userinfoinsert.do")
public class UserinfoInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UserinfoInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("Member/userinfo_insert.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String gubun = request.getParameter("gubun");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String job = request.getParameter("job");
		String intro = request.getParameter("intro");
		String []fa = request.getParameterValues("fa");
		String last_time = request.getParameter("last_time");
		String first_time = request.getParameter("first_time");
		
		String favorite = "";
		if(fa != null) {
			for(int i = 0 ; i < fa.length ; i ++) {
				favorite = favorite + fa[i];
			}	
		}
		
		
		
		SampleVO sVO = new SampleVO();
		sVO.setName(name);
		sVO.setUserid(userid);
		sVO.setPasswd(passwd);
		sVO.setGubun(gubun);
		sVO.setZipcode(zipcode);
		sVO.setAddr1(addr1);
		sVO.setAddr2(addr2);
		sVO.setTel(tel);
		sVO.setEmail(email);
		sVO.setJob(job);
		sVO.setIntro(intro);
		sVO.setFavorite(favorite);
		sVO.setLast_time(last_time);
		sVO.setFirst_time(first_time);
		
		MemberDAO mDAO = MemberDAO.getInstance();
		int row = mDAO.insertMember(sVO);
		
		RequestDispatcher rd = request.getRequestDispatcher("userinfolist.do");
		rd.forward(request, response);
	
	}


}
