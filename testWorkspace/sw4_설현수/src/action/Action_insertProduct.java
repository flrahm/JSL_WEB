package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;
import vo.ProductVO;

public class Action_insertProduct implements sw4action {

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
		int insertOk = pdao.insert_product(pvo);
		System.out.println("action_insert / insertok : " + insertOk);
		response.sendRedirect("index.jsp");
	}

}
