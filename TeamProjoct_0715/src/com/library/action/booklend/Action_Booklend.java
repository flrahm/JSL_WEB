package com.library.action.booklend;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.dao.DAO_Booklend;
import com.library.dao.DAO_MemberGrade;
import com.library.util.Util_sms;
import com.library.vo.VO_Booklend;
import com.library.vo.VO_MemberGrade;

public class Action_Booklend implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String lenddue = request.getParameter("lenddue"); // 반납예정일자
		String memberid = request.getParameter("memberid"); // 회원 id
		String grade = request.getParameter("grade"); // 회원 등급
		String mambername = request.getParameter("membername");
		String bookno = request.getParameter("bookno");
		String bookname = request.getParameter("bookname");
		int nowpage = 1;
		if (request.getParameter("nowpage") != null) {
			nowpage = Integer.parseInt(request.getParameter("nowpage"));
		}
		VO_Booklend lvo = new VO_Booklend();
		lvo.setBookno(bookno);
		lvo.setLenddue(lenddue);
		lvo.setLendid(memberid);
		DAO_Booklend dao = DAO_Booklend.getInstance();
		String seq = dao.booklend_seq(); // lendno 생성
		DAO_MemberGrade gdao = DAO_MemberGrade.getInstance();
		VO_MemberGrade gvo = gdao.memberGrade_search(grade); // 회원 등급으로 검색
		int book_lend_max_num = gvo.getMaxlendnum(); // 등급 별 최대 대여수
		int bookcnt = dao.booklend_count(memberid); // 책 대여수 조회
		String url = "";
		if (book_lend_max_num <= bookcnt) {
			// 빌릴 수 없음
			request.setAttribute("mambername", mambername);
			url = "booklend/booklend_insert_x.jsp";
		} else {
			// 책 등록
			int row = dao.booklend_insert(lvo, seq);
			DAO_BookList booklist_dao = DAO_BookList.getInstance();
			if (row == 1) {
				booklist_dao.booklist_lendCnt_lendtypesw(bookno); // 책 등록 성공시 lend상태 변경, 대여 수 증가

				// sms
//				Util_sms util_sms = new Util_sms();
//				String[] forSms = dao.sms_lend(memberid);
//				util_sms.lendSMS(forSms[0], forSms[1], forSms[2], forSms[3], forSms[4], request, response);
			}
			request.setAttribute("bookname", bookname);
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("row", row);
			url = "booklend/booklend_insert_pro.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}