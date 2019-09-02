package com.library.action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.util.Util_sms;

public class MembeAuthenticationAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tel = request.getParameter("phone");
		System.out.println("atn class=" + tel);
		if (tel != null) {
			HttpSession atsession = request.getSession();
			int authenticNum = 0;
			authenticNum = (int) Math.floor((Math.random() * (999999 - 100000 + 1))) + 100000;
			atsession.setAttribute("cnt", 0);
			atsession.setAttribute("authenticNum", authenticNum);
			Util_sms sms = new Util_sms();
			System.out.println("random code=" + authenticNum);
			
			
			sms.authenticSMS("" + authenticNum, tel, request, response);
			// 문자 날리는 부분
		}
		RequestDispatcher rd = request.getRequestDispatcher("member/member_authenticNum.jsp");
		rd.forward(request, response);
	}
}