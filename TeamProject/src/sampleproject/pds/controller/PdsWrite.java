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
					request, // request ��ü
					uploadFilePath, //�������� ���� ���丮
					uploadFileSizeLimit, //�ִ� ���ε� ���� ũ��
					encType, //���ڵ� ���
					// ������ �̸��� �����ϸ� ���ο� �̸��� �ο���
					new DefaultFileRenamePolicy());
				//���ε�� ������ �̸����
			String fileName = multi.getFilesystemName("filename");
			
			if(fileName == null) { //������ ���ε� ���� �ʾ�����
				System.out.println("������ ���ε� ���� �ʾ���");
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
				System.out.println("���ܹ߻� :" + e);
			} //catch
			}
	
}
