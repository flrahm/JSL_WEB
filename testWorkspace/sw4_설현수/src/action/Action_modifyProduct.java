package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;
import vo.ProductVO;

public class Action_modifyProduct implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ProductVO pvo = new ProductVO();
		pvo.setPname(request.getParameter("pname"));
		pvo.setCode(request.getParameter("code"));
		pvo.setGcode(request.getParameter("gcode"));
		pvo.setCost(Integer.parseInt(request.getParameter("cost")));
		pvo.setPnum(Integer.parseInt(request.getParameter("pnum")));
		pvo.setJnum(Integer.parseInt(request.getParameter("jnum")));
		pvo.setSale(Integer.parseInt(request.getParameter("sale")));
		
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		int updateOk = pdao.update_product(pvo);
		System.out.println("action_update / updateok : " + updateOk);
		
		request.setAttribute("code", request.getParameter("code"));
		RequestDispatcher rd = request.getRequestDispatcher("pm?cmd=pd_search");
		rd.forward(request, response);
	}

}
