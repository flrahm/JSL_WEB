package pds.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pds.dao.PdsDAO;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/Pds/pds_delete.jsp");
		String num = request.getParameter("num");
		request.setAttribute("num", num);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		PdsDAO pdao = PdsDAO.getInstance();
		String passwd = request.getParameter("pass");
		String num = request.getParameter("num");
		boolean flag = pdao.passwdMatch(num, passwd);
		String url = "";
		if(flag) {
			
			url = "/Pds/pds_delete_ok.jsp";
			String filename = pdao.getFilename(num);
			System.out.println(filename);
			String filepath = "E:/라이브러리/문서/WebExam/Day_0614/WebContent/Pds/upload/";
			//파일 삭제
			try {
				File file = new File(filepath + filename);
				file.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			
			pdao.deletePds(num);
		}else {
			request.setAttribute("num", num);
			url = "/Pds/pds_delete.jsp";
		}
		request.setAttribute("flag", flag);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
