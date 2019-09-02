package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;

import com.library.dao.DAO_Member;

@WebServlet("/send")
public class send extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "mailtesting2525"); // 서버 아이디만 쓰기
		props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		Authenticator auth = new MyAuthentication();
		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		System.out.println("session=" + session);
		String mailflag = "" + (int) request.getAttribute("mailflag");
		System.out.println("mailsend flag=" + mailflag);
		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			// InternetAddress from = new InternetAddress("보내는 사람") ;
			InternetAddress from = new InternetAddress("mailtesting2525@gmail.com");
			// 이메일 발신자
			msg.setFrom(from);
			// 이메일 수신자
			String email = "";
			if (mailflag.equals("1")) {
				email = (String) request.getAttribute("email");
			} else {
				// email = request.getParameter("email"); //사용자가 입력한 이메일 받아오기
				email = (String) request.getAttribute("email");
			}
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			// String mailflag= (String)request.getAttribute("mailflag");
			System.out.println("mailsend flag=" + mailflag);
			if (mailflag.equals("1")) {
				// 이메일 제목
				msg.setSubject("도서관 아이디입니다", "UTF-8");
				// 이메일 내용
				String memberid = (String) request.getAttribute("memberid"); // 인증번호 값 받기
				request.setAttribute("memberid", memberid);
				System.out.println("memberid=" + memberid);
				msg.setText(memberid, "UTF-8");
			} else {
				// 이메일 제목
				msg.setSubject("임시 비밀번호입니다", "UTF-8");
				// 이메일 내용
				String code = (String) request.getAttribute("code_check"); // 인증번호 값 받기
				request.setAttribute("code", code);
				System.out.println("code=" + code);
				msg.setText(code, "UTF-8");
			}
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			// 메일보내기
			javax.mail.Transport.send(msg);
			System.out.println("보냄!");
		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		}
		if (mailflag.equals("1")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일을 보냈습니다'); opener.location.href='main.jsp'; self.close(); </script>");
			out.flush();
		} else {
			DAO_Member dao = DAO_Member.getInstance();
			String code = (String) request.getAttribute("code_check");
			String memberid = (String) request.getAttribute("memberid");
			int row = dao.member_pwmodify(sha.sha256(code), memberid);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(
					"<script>alert('임시비밀번호를 메일로 발급했습니다:)'); opener.location.href='main.jsp'; self.close();</script>");
			out.flush();
		}
	}
}

class MyAuthentication extends Authenticator {
	PasswordAuthentication pa;

	public MyAuthentication() {
		String id = "mailtesting2525"; // 구글 ID
		String pw = "asd123^^"; // 구글 비밀번호
		// ID와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id, pw);
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}