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
		out.print("�Է��� ���� <br>");
		out.print("���̵� :" + userid + "<br>" );
		out.print("��й�ȣ :" + userpw + "<br>" );
		out.print("<a href = 'javascript:history.go(-1)'>�ٽ�</a>");
		out.print("</body></html>");
		out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
