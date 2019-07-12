package controller;

import action.Action_goMain;
import action.Action_goWriteProduct;
import action.Action_insertProduct;
import action.Action_modifyProduct;
import action.Action_priorityList;
import action.Action_productDelete;
import action.Action_productSearch;
import action.Action_productView;
import action.Action_profitRank;
import action.Action_stuckByGroup;
import action.sw4action;

public class ActionFactory {
	
	public sw4action selectAction(String cmd) {
		
		sw4action action = null;
		
		if(cmd.equals("pd_goInput")) {
			action = new Action_goWriteProduct();
		}else if(cmd.equals("pd_view")) {
			action = new Action_productView();
		}else if(cmd.equals("pri_list")) {
			action = new Action_priorityList();
		}else if(cmd.equals("p_rank")) {
			action = new Action_profitRank();
		}else if(cmd.equals("stuck_byG")) {
			action = new Action_stuckByGroup();
		}else if(cmd.equals("goMain")) {
			action = new Action_goMain();
		}else if(cmd.equals("pd_input")) {
			action = new Action_insertProduct();
		}else if(cmd.equals("pd_search")) {
			action = new Action_productSearch();
		}else if(cmd.equals("pd_modify")) {
			action = new Action_modifyProduct();
		}else if(cmd.equals("pd_delete")) {
			action = new Action_productDelete();
		}else {
		
		}
		
		System.out.println("actionFactory / action :" + action);
		return action;
		
	}
}
