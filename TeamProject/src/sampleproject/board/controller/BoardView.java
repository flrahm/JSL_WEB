package sampleproject.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;

@WebServlet("/boardview.do")
public class BoardView extends HttpServlet {
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
	
    public BoardView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();
		
		
		 boolean found = true;

			Cookie info = null;
			Cookie[] cookies = request.getCookies();//��Ű �� ��������
			for(int i=0;i<cookies.length;i++) {
				info = cookies[i];
				if(info.getName().contentEquals("boardCookie"+num)) {
					found=false;
					break;
				}
			}
			System.out.println(found);
			String newValue = ""+System.currentTimeMillis();
			if(found) {//��Ű�� ������
		         info = new Cookie("boardCookie" + num, newValue); //��Ű ������ִ� ������,�տ��� ��Ű�̸��̰� �ڴ� �����̴�
		         info.setMaxAge(60*60*24); //�Ϸ�  //�ð� �����ֱ�~
		         response.addCookie(info); //���⿡ �߰� ������� 
		         dao.boardCount(num); //��ȸ�� 
		         System.out.println(info);
		         System.out.println(num);
		      }			
			
			
			BoardVO vo = dao.boardView(num);
			request.setAttribute("vo",vo);
			vo.setContents(lineBreak(vo.getContents()));
		RequestDispatcher rd = request.getRequestDispatcher("Board/board_view.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("boardview.do-post");
	}

}
