package sampleproject.guest.controller;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.guest.dao.GuestDAO;
import sampleproject.guest.vo.GuestVO;

@WebServlet("/guestview.do")
public class GuestView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  public String lineBreak(String str){
	  		StringBuffer buf = new StringBuffer();
	  		for(int i=0; i<str.length();i++){
	  			if(str.charAt(i)=='\n'){
	  				buf.append("<br>");
	  			}else{
	  				buf.append(str.charAt(i));
	  			}
	  		}
	  	
	  		return buf.toString();
	  	}

	
	
    public GuestView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx= Integer.parseInt(request.getParameter("idx"));
		GuestDAO dao=GuestDAO.getInstance();
		boolean found=false;
		Cookie info= null;
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++) {
			info=cookies[i];
			if(info.getName().equals("GuestCookie"+idx)) {
				found=true;
				break;
			}
		}//for¹®ÀÇ ³¡
		String newValue=""+System.currentTimeMillis();
		if(!found) {
			info=new Cookie("GuestCookie"+idx,newValue);
			info.setMaxAge(60*60*24);
			response.addCookie(info);
			dao.guestCount(idx);
		}
		GuestVO vo = (GuestVO)dao.guestView(idx);
		request.setAttribute("vo", vo);
		vo.setContents(lineBreak(vo.getContents()));
		RequestDispatcher rd=request.getRequestDispatcher("Guest/guest_view.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("guestview.do-post");
	}

}
