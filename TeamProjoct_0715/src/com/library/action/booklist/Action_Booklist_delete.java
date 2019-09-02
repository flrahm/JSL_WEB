package com.library.action.booklist;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_BookList;

public class Action_Booklist_delete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookno = request.getParameter("bookno");
		DAO_BookList dao = DAO_BookList.getInstance();

		String bookimg = dao.booklist_bookimg_search(bookno); // 삭제 전 bookimg 이름 찾기
		String savedir = "C:\\hrdkorea\\TeamProject\\WebContent\\img";

		File file = new File(savedir, bookimg);
		if (file.exists()) {
			file.delete();
		}
		int row = dao.booklistDelete(bookno);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_delete_pro.jsp");
		rd.forward(request, response);
	}
}