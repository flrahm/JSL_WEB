package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;

public class Action_productDelete implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		int deleteOk = pdao.delete_product(code);
		System.out.println("action_delete / deleteOk : " + deleteOk);
		response.sendRedirect("pm?cmd=pd_view");
	}

}
