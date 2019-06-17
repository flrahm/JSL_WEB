package pds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pds.dao.PdsDAO;
import pds.vo.PdsVO;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/view")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		PdsDAO pdao = PdsDAO.getInstance();
		PdsVO pvo = pdao.selectByNum(num);
		request.setAttribute("pvo", pvo);
		
		Cookie[] cookies = request.getCookies();
		boolean readBefore = false;
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("pvo_read_"+num)) {
				readBefore = true;
				break;
			}
		}
		if(!readBefore) {
			pdao.readcntHits(num);
			String cookieName = "pvo_read_"+num;
			String cookieValue = ""+ System.currentTimeMillis();
			Cookie cookie = new Cookie(cookieName,cookieValue);
			cookie.setMaxAge(60*30);
			response.addCookie(cookie);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/Pds/pds_view.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
