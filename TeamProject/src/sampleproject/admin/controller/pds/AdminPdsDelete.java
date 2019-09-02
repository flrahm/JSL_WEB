package sampleproject.admin.controller.pds;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.pds.dao.PdsDAO;

/**
 * Servlet implementation class AdminPdsDelete
 */
@WebServlet("/adminpdsdelete.do")
public class AdminPdsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPdsDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		  String fileName = request.getParameter("filename");
	      String fileDir = "upload"; //지울 파일이 존재하는 디렉토리
	      String filePath = request.getRealPath(fileDir) + "/"; //파일이 존재하는 실제경로
	      filePath += fileName;
	      System.out.println(filePath);
	         File f = new File(filePath); // 파일 객체생성
	         if(f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.
		 
		   PdsDAO dao = PdsDAO.getInstance();
		   dao.pdsDelete(num);
		 
		 response.sendRedirect("adminpdslist.do");
	}

}
