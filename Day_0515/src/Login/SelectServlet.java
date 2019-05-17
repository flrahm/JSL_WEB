package Login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset = utf-8" );
		String job = request.getParameter("job");
		String[] interest = request.getParameterValues("interest");
		
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><body>");
		out.print("당신이 선택한 직업 : " + job + "<br>");
		out.print("<br>");
		
		out.print("당신이 선택한 관심사 : ");
		if(interest == null)
			out.print("없음 <br>" );
		else {
			for(int i = 0; i < interest.length ; i++) {
				out.print(interest[i]);
				if(i != (interest.length-1))
					out.print(",");
			}
			out.print("<br>");
		}
		
		
		out.print("<a href = 'javascript:history.go(-1)'>다시</a>");
		out.print("</body></html>");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
