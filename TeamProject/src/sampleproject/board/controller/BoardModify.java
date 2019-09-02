package sampleproject.board.controller;




import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;

@WebServlet("/boardmodify.do")
public class BoardModify extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public BoardModify() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      int num=Integer.parseInt(request.getParameter("num"));
      request.setAttribute("flag", request.getParameter("flag"));
      BoardDAO dao = BoardDAO.getInstance();
      BoardVO vo = dao.boardView(num);
      request.setAttribute("vo",vo);
      RequestDispatcher requestDispatcher = request.getRequestDispatcher("Board/board_modify.jsp");
      requestDispatcher.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("ddd");
      request.setCharacterEncoding("utf-8");
      BoardVO vo = new BoardVO(); 
        vo.setName(request.getParameter("name"));
        vo.setEmail(request.getParameter("email"));
        vo.setSubject(request.getParameter("subject"));
        vo.setContents(request.getParameter("contents"));
        vo.setPass(request.getParameter("pass"));
        vo.setIndate(request.getParameter("indate"));
       vo.setNum(Integer.parseInt(request.getParameter("num"))); 
      BoardDAO dao = BoardDAO.getInstance();
      
      String inputPass =request.getParameter("pass");
      String num = request.getParameter("num");
      String pass=dao.selectPassByNum(num);
      String flag="-1";
      if(pass.equals(inputPass)) {
         flag="1";
         request.setAttribute("vo",vo);
         dao.boardModi(vo);
         response.sendRedirect("boardlist.do");
         System.out.println("post"+num);
      }else {
      request.setAttribute("flag", flag);
      request.setAttribute("num", num);
   
      response.sendRedirect("boardmodify.do?num="+num+"&flag="+flag);
      }
   }

}