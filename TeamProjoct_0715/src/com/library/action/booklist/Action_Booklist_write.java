package com.library.action.booklist;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.dao.DAO_Booktype;
import com.library.vo.VO_BookList;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Action_Booklist_write implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html:charset=utf-8");
		String path = "C:\\hrdkorea\\TeamProjoct_0715\\WebContent\\img";
		String encType = "utf-8";
		int sizeLimit = 10 * 1024 * 1024;
		VO_BookList vo = new VO_BookList();

		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());

		String booktype = multi.getParameter("booktype");
		if (booktype.equals("") || booktype == null) {
			vo.setBooktype("");
		} else {
			vo.setBooktype(booktype);
		}
		String writer = multi.getParameter("writer");
		if (writer.equals("") || writer == null) {
			vo.setWriter("");
		} else {
			vo.setWriter(writer);
		}
		String publisher = multi.getParameter("publisher");
		if (publisher.equals("") || publisher == null) {
			vo.setPublisher("");
		} else {
			vo.setPublisher(publisher);
		}
		String bookimg = multi.getFilesystemName("bookimg");
		if (bookimg.equals("") || bookimg == null) {
			vo.setBookimg("");
		} else {
			vo.setBookimg(bookimg);
		}

		// bookno 만들기
		DAO_Booktype btDAO = DAO_Booktype.getInstance();
		vo.setBookno(btDAO.makeBookNo(booktype));

		vo.setBookname(multi.getParameter("bookname"));

		DAO_BookList dao = DAO_BookList.getInstance();
		int row = dao.booklistInsert(vo);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_insert_pro.jsp");
		rd.forward(request, response);
	}
}