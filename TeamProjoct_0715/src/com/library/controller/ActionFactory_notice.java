package com.library.controller;

import com.library.action.Action;
import com.library.action.notice.Action_Notice_Delete;
import com.library.action.notice.Action_Notice_List;
import com.library.action.notice.Action_Notice_Modify;
import com.library.action.notice.Action_Notice_Modify_Pro;
import com.library.action.notice.Action_Notice_View;
import com.library.action.notice.Action_Notice_Write;
import com.library.action.notice.Action_Notice_Write_Pro;

public class ActionFactory_notice implements ActionFactory {
	private static ActionFactory_notice instance = new ActionFactory_notice();

	public ActionFactory_notice() {
		super();
	}

	public static ActionFactory_notice getInstance() {
		return instance;
	}

	@Override
	public Action getAction(String cmd) {
		Action action = null;

		if (cmd.equals("notice")) {
			action = new Action_Notice_List();
		} else if (cmd.equals("notice_write")) {
			action = new Action_Notice_Write();
		} else if (cmd.equals("notice_write_pro")) {
			action = new Action_Notice_Write_Pro();
		} else if (cmd.equals("notice_view")) {
			action = new Action_Notice_View();
		} else if (cmd.equals("notice_modify")) {
			action = new Action_Notice_Modify();
		} else if (cmd.equals("notice_modify_pro")) {
			action = new Action_Notice_Modify_Pro();
		} else if (cmd.equals("notice_delete")) {
			action = new Action_Notice_Delete();
		}
		return action;
	}
}