package Login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset = UTF-8");
		
		String userid = request.getParameter("id");
		String userpw = request.getParameter("pw");
		
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("입력한 정보 <br>");
		out.print("아이디 :" + userid + "<br>" );
		out.print("비밀번호 :" + userpw + "<br>" );
		out.print("<a href = 'javascript:history.go(-1)'>다시</a>");
		out.print("</body></html>");
		out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
