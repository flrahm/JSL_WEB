package javaScript_01.userInfo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userInsertOk
 */
@WebServlet("/userInsertOk")
public class userInsertOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public userInsertOk() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		//String fa = request.getParameter("fa");// �迭�� �Ѿ���µ� ���� �ϳ��� �޾ƿ�
		String[] fa = request.getParameterValues("fa");
		String job = request.getParameter("job");
		String fav = "";
		if (fa != null)
			for (int i = 0; i < fa.length; i++) {
				fav += fa[i];
				if (i != fa.length - 1)
					fav += ",";
			}
		
		request.setAttribute("name", name);
		request.setAttribute("userid", userid);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Member/userinfo_insert_ok02.jsp");
		rd.forward(request, response);
		
		
		doGet(request, response);
	}

}
