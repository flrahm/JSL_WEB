package pds.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class FileDownloadServlet2
 */
@WebServlet("/filedown2")
public class FileDownloadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String filename = request.getParameter("filename"); //파일 이름을 받는다. 
		String path = "E:/라이브러리/문서/WebExam/Day_0614/WebContent/Pds/upload/";

		File file = new File(path+filename); // 절대경로입니다.
		String Agent=request.getHeader("USER-AGENT");
		response.setContentType("application/unknown");  //화일형태
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);

		try{
			byte b[] = new byte[5 * 1024 * 1024];  //5M byte까지 업로드가 가능하므로 크기를 이렇게 잡아주었음.
			if (file.isFile()){
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));  
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());  
				try { 
					int read = 0;  
					while ((read = fin.read(b)) != -1){
						outs.write(b,0,read);
					}
					outs.flush();
					outs.close();  
					fin.close();         
				}catch(Exception e){
					e.printStackTrace();
				}       
			}
		}catch(IllegalStateException se){
			se.printStackTrace();
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
