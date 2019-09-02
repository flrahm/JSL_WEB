package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;

public class MembeAuthenticationAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String inputatn = request.getParameter("inputatn");
		HttpSession atsession = request.getSession();

		String authenticNum = "" + atsession.getAttribute("authenticNum");
		int cnt = (Integer) atsession.getAttribute("cnt");
		int flag = 0;
		PrintWriter out = response.getWriter();
		if (authenticNum.equals(inputatn)) {// 인증번호일치시
			flag = -1;
			out.println("<script>alert('인증되었습니다'); opener.checkhidden(); self.close();</script>");
			// out.println("<script>alert('인증되었습니다'); opener.checkhidden();
			// opener.member.atn.value='true'; self.close();</script>");
			out.flush();
			atsession.invalidate();
		} else {// 불일치
			flag = 1;
			cnt++;
			atsession.setAttribute("cnt", cnt);
			System.out.println("else cnt=" + cnt);
			if (cnt >= 3) {// 3회이상 불일치
				atsession.invalidate();
				out.println("<script>alert('" + cnt + "회 틀렸습니다. 다시 인증받으세요'); self.close();</script>");
				out.flush();
			} else {
				out.println("<script>alert('" + cnt
						+ "회 틀렸습니다.'); location.href='member?cmd=member_authentication';</script>");
				out.flush();
			}
		}
	}
}