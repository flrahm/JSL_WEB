package com.library.action.booklend;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.library.action.Action;
import com.library.dao.DAO_chart;

public class Action_Booklend_personalChart implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		// �����
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		DAO_chart cdao = DAO_chart.getInstance();
		HttpSession session = request.getSession();
		
		
		String base = request.getParameter("base");	// � ��Ʈ �����͸� ������ ������
		String userid = (String)session.getAttribute("loginid");	// ���ǿ��� ��������
		if(userid == null)
			userid = "";
		
		String year = request.getParameter("year");		// getParameter�� ��������
		//System.out.println("action_booklend / year : " + year );
		///////////////////////////////////////////////////
		
		
		// �� Ÿ�Կ� ���� �����͸� ��û���� ���
		if(base.equals("typeBased")) {
			List<String[]> typeBasedList = cdao.personal_typeBased(userid);
			for(int i = 0; i < typeBasedList.size(); i++ ) {
				String[] pair = typeBasedList.get(i);
				obj.put(pair[0],Integer.parseInt(pair[1]));
			}
		}else if(base.equals("monthlyBased")) {
				try {
					Integer.parseInt(year);
				}catch(Exception e){
					year = "" + LocalDate.now().getYear();
				}
			
			String[] monthlyBasedArr = cdao.personal_monthlyBased(year, userid);
			for(int i =0; i < monthlyBasedArr.length; i++) {
				obj.put((i+1) + "��", Integer.parseInt(monthlyBasedArr[i]));
			}
		}
		
		
		// ������ ���
		out.print(obj);
		out.flush();
		out.close();
		
	}

}
