package expressionLanguage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO mvo1 = new MemberVO("HONG","h2216");
		MemberVO mvo2 = new MemberVO("KIM","k2216");
		MemberVO mvo3 = new MemberVO("SEOL","shss2216");
		request.setAttribute("mvo1", mvo1);
		request.setAttribute("mvo2", mvo2);
		request.setAttribute("mvo3", mvo3);
		RequestDispatcher rd = request.getRequestDispatcher("WebContent/expressionLanguage/useBean.jsp");
		rd.forward(request, response);
	}
}
