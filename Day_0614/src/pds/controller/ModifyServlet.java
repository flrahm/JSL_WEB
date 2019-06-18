package pds.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pds.dao.PdsDAO;
import pds.vo.PdsVO;

/**
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/modify")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/Pds/pds_modify.jsp");
		PdsDAO pdao = PdsDAO.getInstance();
		String num = request.getParameter("num");
		PdsVO pvo = pdao.selectByNum(num);
		request.setAttribute("pvo", pvo);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = UTF-8");
		int uploadFileMaxSize = 10 * 1024 * 1024;
		String encType = "UTF-8";
		String uploadFilePath = "E:\\라이브러리\\문서\\WebExam\\Day_0614\\WebContent\\Pds\\upload";
		PdsDAO pdao = PdsDAO.getInstance();
		

		
		
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
			int num = Integer.parseInt(multi.getParameter("num"));
			PdsVO pvo = new PdsVO();
			pvo.setContents(contents);
			pvo.setFilename(filename);
			pvo.setSubject(subject);
			pvo.setPass(pass);
			pvo.setName(name);
			pvo.setNum(num);
			/*
			 * System.out.println(filename); System.out.println(name);
			 * System.out.println(subject); System.out.println(contents);
			 * System.out.println(pass);
			 */
			
			
			//파일 삭제
			String deletefilename = pdao.getFilename(""+num);
			String deletefilepath = "E:/라이브러리/문서/WebExam/Day_0614/WebContent/Pds/upload/";
			
			try {
				File file = new File(deletefilepath + deletefilename);
				file.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			// 수정
			int updateOK = pdao.updatePds(pvo);
			System.out.println(updateOK);
			
			/*
			 * request.setAttribute("fileName", fileName); request.setAttribute("name",
			 * multi.getParameter("name")); request.setAttribute("subject",
			 * multi.getParameter("subject"));
			 */		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("list");
	}

}
