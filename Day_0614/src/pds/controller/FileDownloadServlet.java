package pds.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/filedown")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String filename = request.getParameter("filename");
		String filepath = "E:/라이브러리/문서/WebExam/Day_0614/WebContent/Pds/upload/";
		
		String mime = "application/octet-stream;";
		String charSet = "utf-8";		
		String userAgent = request.getHeader("User-Agent");
		
		response.setContentType(mime+"charset="+charSet);
		
		
		
		InputStream inputStr = null;		
		BufferedInputStream bufferedInputStr = null;
		BufferedOutputStream bufferedOutputStr = null;
		
		try {
			inputStr = new FileInputStream(filepath+filename);
			bufferedInputStr = new BufferedInputStream(inputStr);
			bufferedOutputStr = new BufferedOutputStream(response.getOutputStream());
			int read = 0;
			
			byte[] buffer = new byte[5 * 1024 * 1024];
			
			while((read = bufferedInputStr.read(buffer))!= -1) {
				bufferedOutputStr.write(buffer,0,read);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				bufferedInputStr.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
			
			try {
				bufferedOutputStr.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
			
			try {
				inputStr.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
