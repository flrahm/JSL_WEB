package pds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.bind.v2.runtime.Location;

import pds.dao.PdsDAO;
import pds.vo.PdsVO;

/**
 * Servlet implementation class WriteServlet
 */
@WebServlet("/write")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 *
	 *      public WriteServlet() { super(); // TODO Auto-generated constructor stub
	 *      }
	 * 
	 *      /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/Pds/pds_write.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = UTF-8");

		String savePath = "upload";
		int uploadFileMaxSize = 10 * 1024 * 1024;
		String encType = "UTF-8";

		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);

		try {
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadFilePath,
					uploadFileMaxSize,
					encType,
					new DefaultFileRenamePolicy()
					);
			
			String filename = multi.getFilesystemName("filename");
			String name = multi.getParameter("name");
			String subject = multi.getParameter("subject");
			String contents = multi.getParameter("contents");
			String pass = multi.getParameter("pass");
			
			PdsVO pvo = new PdsVO();
			pvo.setContents(contents);
			pvo.setFilename(filename);
			pvo.setSubject(subject);
			pvo.setPass(pass);
			pvo.setName(name);
			
			System.out.println(filename);
			System.out.println(name);
			System.out.println(subject);
			System.out.println(contents);
			System.out.println(pass);
			PdsDAO pdao = PdsDAO.getInstance();
			
			
			int insertOK = pdao.insertPds(pvo);
			System.out.println(insertOK);
			
			/*
			 * request.setAttribute("fileName", fileName); request.setAttribute("name",
			 * multi.getParameter("name")); request.setAttribute("subject",
			 * multi.getParameter("subject"));
			 */		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("./list");
		
	}

}
