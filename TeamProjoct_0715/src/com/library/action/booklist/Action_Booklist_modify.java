package com.library.action.booklist;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.vo.VO_BookList;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Action_Booklist_modify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = "C:\\hrdkorea\\TeamProjoct_0715\\WebContent\\img";
		String encType = "utf-8";
		int sizeLimit = 5 * 1024 * 1024;
		VO_BookList vo = new VO_BookList();

		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		String bookno = multi.getParameter("bookno");
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
		String lend = multi.getParameter("lend");
		if (lend.equals("") || lend == null) {
			vo.setLend(1);
		} else {
			vo.setLend(Integer.parseInt(lend));
		}
		String publisher = multi.getParameter("publisher");
		if (publisher.equals("") || publisher == null) {
			vo.setPublisher("");
		} else {
			vo.setPublisher(publisher);
		}
		String bookimg = multi.getFilesystemName("bookimg");
		String bookimg_copy = multi.getParameter("bookimg_copy");
		if (bookimg == null || bookimg.equals("")) {
			vo.setBookimg(bookimg_copy);
		} else {
			vo.setBookimg(bookimg);
			File file = new File(path + "\\" + bookimg_copy);
			file.delete();
		}
		/*
		 * PrintWriter out = response.getWriter();
		 * response.setContentType("text/html; charset=UTF-8");
		 * out.println(" <script> alert('aaa');    </script>"); out.flush();
		 */
		vo.setBookno(multi.getParameter("bookno"));
		vo.setBookname(multi.getParameter("bookname"));
		vo.setRegdate(multi.getParameter("regdate"));
		DAO_BookList dao = DAO_BookList.getInstance();
		int row = dao.booklistUpdate(vo, bookno);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_modify_pro.jsp");
		rd.forward(request, response);
	}
}