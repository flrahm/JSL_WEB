package com.library.action.booklend;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.dao.DAO_Booklend;
import com.library.util.Util_sms;

public class Action_Booklend_return implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String lendno = request.getParameter("lendno");
		String bookno = request.getParameter("bookno");		
		DAO_Booklend lend_dao = DAO_Booklend.getInstance();
		DAO_BookList list_dao = DAO_BookList.getInstance();		
		int row = lend_dao.booklend_return(lendno);
		if(row == 1) {
			list_dao.booklist_return_lend(bookno); // 반납 성공 이면 대출상태 바꿈
			//sms
//			Util_sms util_sms = new Util_sms();
//			String[] return_sms = lend_dao.sms_return(lendno);			
//			util_sms.returnSMS(return_sms[0], return_sms[1], return_sms[2], return_sms[3], return_sms[4], request, response);
		}		
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("booklend/booklend_return_pro.jsp");
		rd.forward(request, response);		
	}
}