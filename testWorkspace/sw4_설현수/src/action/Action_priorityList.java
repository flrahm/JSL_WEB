package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;

public class Action_priorityList implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		List<String[]> priList = pdao.select_ByProductPriority();
		request.setAttribute("priList", priList);
		RequestDispatcher rd = request.getRequestDispatcher("priority_list.jsp");
		rd.forward(request, response);

	}

}
