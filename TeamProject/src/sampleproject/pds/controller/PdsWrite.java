package sampleproject.pds.controller;

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

import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;

@WebServlet("/pdswrite.do")
public class PdsWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PdsWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_write.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		PdsDAO dao = PdsDAO.getInstance();
		PdsVO vo = new PdsVO();
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, // request 객체
					uploadFilePath, //서버상의 실제 디렉토리
					uploadFileSizeLimit, //최대 업로드 파일 크기
					encType, //인코딩 방법
					// 동일한 이름이 존재하면 새로운 이름이 부여됨
					new DefaultFileRenamePolicy());
				//업로드된 파일의 이름얻기
			String fileName = multi.getFilesystemName("filename");
			
			if(fileName == null) { //파일이 업로드 되지 않았을때
				System.out.println("파일이 업로드 되지 않았음");
			}else { 
				String name = multi.getParameter("name");
				String email = multi.getParameter("email");
				String subject = multi.getParameter("subject");
				String contents = multi.getParameter("contents");
				String pass = multi.getParameter("pass");
				vo.setName(name);
				vo.setPass(pass);
				vo.setEmail(email);
				vo.setSubject(subject);
				vo.setContents(contents);
				vo.setFilename(fileName);
				dao.pdsWrite(vo);
				response.sendRedirect("pdslist.do");
//				RequestDispatcher rd = request.getRequestDispatcher("pds_list.do");
//				rd.forward(request, response);
			}			
		} catch (Exception e) {
				System.out.println("예외발생 :" + e);
			} //catch
			}
	
}
