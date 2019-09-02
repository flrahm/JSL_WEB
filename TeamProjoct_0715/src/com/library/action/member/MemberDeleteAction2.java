package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.dao.DAO_Member;

public class MemberDeleteAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_Member dao = DAO_Member.getInstance();
		HttpSession session = request.getSession();
		// 로그인한 사람의 아이디로 정보 삭제(세션값)
		String memberid = (String) session.getAttribute("loginid");
		// String inputpw = request.getParameter("memberpasswd");
		String inputpw = sha.sha256(request.getParameter("memberpasswd"));
		// 탈퇴전 비밀번호 입력하며 일치하지 않으면 탈퇴불가
		int flag = dao.member_login(memberid, inputpw);
		if (flag != 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지않습니다'); location.href='member?cmd=member_delete';</script>");
			out.flush();
		} else { // 비밀번호 일치할 경우 삭제
			int row = dao.member_delete(memberid);
			// 0이 아닐시 탈퇴
			if (row != 1) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('" + memberid + "님 탈퇴 실패하였습니다'); location.href='history.back()';</script>");
				out.flush();
			} else {
				session.invalidate();
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('" + memberid
						+ "님 탈퇴되었습니다'); opener.location.replace='admin?cmd=main'; self.close(); </script>");
				out.flush();
			}
		}
	}
}