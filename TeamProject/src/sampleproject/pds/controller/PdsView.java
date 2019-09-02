package sampleproject.pds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;

@WebServlet("/pdsview.do")
public class PdsView extends HttpServlet {
	private String linebreak(String str){
		StringBuffer buf = new StringBuffer();
		for(int i=0; i<str.length(); i++){
			if(str.charAt(i)=='\n'){
				buf.append("<br>");
			}else{
				buf.append(str.charAt(i));
			}
		}
		return buf.toString();
	}
	private static final long serialVersionUID = 1L;
	private Cookie info;
	
	
    public PdsView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));

		PdsDAO dao = PdsDAO.getInstance();		
		boolean found = false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			info = cookies[i];
			if (info.getName().equals("pdsCookie" + num)) {
				found = true;
				break;
			}
		}
			String newValue = "" + System.currentTimeMillis();
	
			if (!found) { // 쿠키가 없으면(화면에 처음접속시)
				int row = dao.pdsCount(num);
				System.out.println(row);
				info = new Cookie("pdsCookie" + num, newValue); // 쿠키생성
				info.setMaxAge(24*60*60);
				response.addCookie(info);
			
			}
			PdsVO vo = dao.pdsView(num);
			int su = vo.getReadcnt();
			request.setAttribute("cnt", su);
			request.setAttribute("vo", vo);
			vo.setContents(linebreak(vo.getContents()));
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_view.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("pdsview.do-post");
	}

}
