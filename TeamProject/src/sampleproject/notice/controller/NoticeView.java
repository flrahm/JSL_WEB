package sampleproject.notice.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;


@WebServlet("/noticeview.do")
public class NoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public NoticeView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		int num =Integer.parseInt(request.getParameter("num"));
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO vo = dao.noticeView(num);
		request.setAttribute("vo",vo);
		
		 boolean found = true;

			Cookie info = null;
			Cookie[] cookies = request.getCookies();//��Ű �� ��������
			for(int i=0;i<cookies.length;i++) {
				info = cookies[i];
				if(info.getName().contentEquals("noticeCookie"+num)) {
					found=false;
					break;
				}
			}
			//System.out.println(found);
			String newValue = ""+System.currentTimeMillis();
			if(found) {//��Ű�� ������
		         info = new Cookie("noticeCookie" + num, newValue); //��Ű ������ִ� ������,�տ��� ��Ű�̸��̰� �ڴ� �����̴�
		         info.setMaxAge(60*60*24); //�Ϸ�  //�ð� �����ֱ�~
		         response.addCookie(info); //���⿡ �߰� ������� 
		         dao.noticeCount(num); //��ȸ�� 
		         //System.out.println(info);
		         //System.out.println(num);
		      }			
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Notice/notice_view.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
