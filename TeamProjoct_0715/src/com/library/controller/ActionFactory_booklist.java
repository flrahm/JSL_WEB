package com.library.controller;

import com.library.action.Action;
import com.library.action.booklist.Action_Booklist_delete;
import com.library.action.booklist.Action_Booklist_insert;
import com.library.action.booklist.Action_Booklist_list;
import com.library.action.booklist.Action_Booklist_modify;
import com.library.action.booklist.Action_Booklist_modify_view;
import com.library.action.booklist.Action_Booklist_search;
import com.library.action.booklist.Action_Booklist_view;
import com.library.action.booklist.Action_Booklist_write;

public class ActionFactory_booklist implements ActionFactory {

	@Override
	public Action getAction(String cmd) {
		Action action = null;
		// booklist
		if (cmd.equals("booklist")) {
			action = new Action_Booklist_list();
		} else if (cmd.equals("booklist_insert")) {
			action = new Action_Booklist_insert();
		} else if (cmd.equals("booklist_write")) {
			action = new Action_Booklist_write();
		} else if (cmd.equals("booklist_modify_view")) {
			action = new Action_Booklist_modify_view();
		} else if (cmd.equals("booklist_modify")) {
			action = new Action_Booklist_modify();
		} else if (cmd.equals("booklist_delete")) {
			action = new Action_Booklist_delete();
		} else if (cmd.equals("booklist_search")) {
			action = new Action_Booklist_search();
		} else if (cmd.equals("booklist_view")) {
			action = new Action_Booklist_view();
		}
		return action;
	}
}