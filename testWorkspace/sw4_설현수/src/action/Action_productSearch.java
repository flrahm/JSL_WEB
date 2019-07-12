package action;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;
import vo.GroupcodeVO;
import vo.ProductVO;

public class Action_productSearch implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		ProductVO pvo = pdao.selectByCode(code);
		List<GroupcodeVO> gcodeList = pdao.select_gcode();
		request.setAttribute("gcodeList", gcodeList);
		
		request.setAttribute("pvo", pvo);
		RequestDispatcher rd = request.getRequestDispatcher("productview.jsp");
		rd.forward(request, response);
		

	}

}
