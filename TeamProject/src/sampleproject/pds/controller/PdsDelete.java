package sampleproject.pds.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;

@WebServlet("/pdsdelete.do")
public class PdsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PdsDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	      int num = Integer.parseInt(request.getParameter("num"));
	      
	      
	      PdsDAO dao = PdsDAO.getInstance();
	      PdsVO vo = dao.pdsView(num);
	      
	      request.setAttribute("vo",vo );
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_delete.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		 //System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAA");
		  String fileName = request.getParameter("filename");
	      String fileDir = "upload"; //���� ������ �����ϴ� ���丮
	      String filePath = request.getRealPath(fileDir) + "/"; //������ �����ϴ� �������
	      filePath += fileName;

	         File f = new File(filePath); // ���� ��ü����
	         if(f.exists()) f.delete(); // ������ �����ϸ� ������ �����Ѵ�.
		 
		   PdsDAO dao = PdsDAO.getInstance();
		   dao.pdsDelete(num);
		 
		 response.sendRedirect("pdslist.do");
		 
	}

}
