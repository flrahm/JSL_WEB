package sampleproject.pds.controller;

import java.io.File;
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

@WebServlet("/pdsmodify.do")
public class PdsModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PdsModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		PdsDAO dao = PdsDAO.getInstance();
		PdsVO vo = dao.pdsView(num);
		request.setAttribute("vo", vo);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_modify.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("pdsmodify.do-post");
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
			
		
				int num = Integer.parseInt(multi.getParameter("num"));
				String name = multi.getParameter("name");
				String email = multi.getParameter("email");
				String subject = multi.getParameter("subject");
				String contents = multi.getParameter("contents");
				String pass = multi.getParameter("pass");
				String filename = multi.getParameter("file1");
				String file1 = multi.getParameter("file1");
				if(fileName!=null) {
					filename = fileName;
				      String filePath = request.getRealPath(savePath) + "/"; //������ �����ϴ� �������
				      filePath += file1;

				         File f = new File(filePath); // ���� ��ü����
				         if(f.exists()) f.delete(); // ������ �����ϸ� ������ �����Ѵ�.	
				}
				
				vo.setNum(num);
				vo.setName(name);
				vo.setPass(pass);
				vo.setEmail(email);
				vo.setSubject(subject);
				vo.setContents(contents);
				vo.setFilename(filename);
				
				dao.pdsModify(vo);
				response.sendRedirect("pdslist.do");
//				RequestDispatcher rd = request.getRequestDispatcher("pds_list.do");
//				rd.forward(request, response);
					
		} catch (Exception e) {
				System.out.println("���ܹ߻� :" + e);
			} //catch
			}

}

