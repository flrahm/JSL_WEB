package action;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;

public class Action_profitRank implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		List<String[]> srList = pdao.select_BySalesRank();
		request.setAttribute("srList", srList);
		RequestDispatcher rd = request.getRequestDispatcher("saleRank_list.jsp");
		rd.forward(request, response);

	}

}
