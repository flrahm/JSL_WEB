package com.library.controller;

import com.library.action.Action;
import com.library.action.admin.Action_Admin_Login;
import com.library.action.admin.Action_Admin_Login_Pro;
import com.library.action.admin.Action_Admin_Logout;
import com.library.action.admin.Action_Admin_MainIndex;
import com.library.action.admin.Action_Admin_Member_List;
import com.library.action.admin.Action_Admin_Member_Modify;
import com.library.action.admin.Action_Admin_Member_Modify_Pro;

public class ActionFactory_Admin implements ActionFactory {
	private static ActionFactory_Admin instance = new ActionFactory_Admin();

	public ActionFactory_Admin() {
		super();
	}

	public static ActionFactory_Admin getInstance() {
		return instance;
	}

	@Override
	public Action getAction(String cmd) {
		Action action = null;

		if (cmd.equals("admin_login")) {
			action = new Action_Admin_Login();
		} else if (cmd.equals("admin_login_pro")) {
			action = new Action_Admin_Login_Pro();
		} else if (cmd.equals("admin_logout")) {
			action = new Action_Admin_Logout();
		} else if (cmd.equals("admin_member_list")) {
			action = new Action_Admin_Member_List();
		} else if (cmd.equals("admin_member_modify")) {
			action = new Action_Admin_Member_Modify();
		} else if (cmd.equals("admin_member_modify_pro")) {
			action = new Action_Admin_Member_Modify_Pro();
		} else if (cmd.equals("main")) {
			action = new Action_Admin_MainIndex();
		}
		return action;
	}
}