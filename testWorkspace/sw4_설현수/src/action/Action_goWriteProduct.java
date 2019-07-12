package action;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAOimpl;
import vo.GroupcodeVO;

public class Action_goWriteProduct implements sw4action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAOimpl pdao = ProductDAOimpl.getInstance();
		List<GroupcodeVO> gcodeList = pdao.select_gcode();
		request.setAttribute("gcodeList", gcodeList);
		
		RequestDispatcher rd = request.getRequestDispatcher("productInsert.jsp");
		rd.forward(request, response);

	}

}
