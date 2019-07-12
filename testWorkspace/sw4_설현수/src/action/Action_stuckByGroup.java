package action;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;

public class Action_stuckByGroup implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		List<String[]> sList = pdao.select_ByQuintityOfStuck();
		request.setAttribute("sList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("stuckByGroup_list.jsp");
		rd.forward(request, response);

	}

}
