package com.library.controller;

import com.library.action.Action;
import com.library.action.member.MembeAuthenticationAction;
import com.library.action.member.MembeAuthenticationAction2;
import com.library.action.member.MemberDeleteAction;
import com.library.action.member.MemberDeleteAction2;
import com.library.action.member.MemberIdcheckAction;
import com.library.action.member.MemberIdcheckAction2;
import com.library.action.member.MemberInsertAction;
import com.library.action.member.MemberInsertAction2;
import com.library.action.member.MemberLoginAction;
import com.library.action.member.MemberLoginAction2;
import com.library.action.member.MemberLogoutAction;
import com.library.action.member.MemberModifyAction;
import com.library.action.member.MemberModifyAction2;
import com.library.action.member.MemberidfoundAction;
import com.library.action.member.MemberidfoundAction2;
import com.library.action.member.MemberpwfoundAction;
import com.library.action.member.MemberpwfoundAction2;

public class ActionFactory_member implements ActionFactory {
	private static ActionFactory_member instance = new ActionFactory_member();// 占쌓쇽옙占쏙옙占썰리占쏙옙 占쏘떤 占쌓쇽옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙娩占�

	ActionFactory_member() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	@Override
	public Action getAction(String cmd) {
		Action action = null;
		if (cmd.equals("member_insert")) {
			action = new MemberInsertAction();
		} else if (cmd.equals("member_insert2")) {
			action = new MemberInsertAction2();
		} else if (cmd.equals("member_login")) {
			action = new MemberLoginAction();
		} else if (cmd.equals("member_logout")) {
			action = new MemberLogoutAction();
		} else if (cmd.equals("member_login2")) {
			action = new MemberLoginAction2();
		} else if (cmd.equals("member_modify")) {
			action = new MemberModifyAction();
		} else if (cmd.equals("member_modify2")) {
			action = new MemberModifyAction2();
		} else if (cmd.equals("member_delete")) {
			action = new MemberDeleteAction();
		} else if (cmd.equals("member_delete2")) {
			action = new MemberDeleteAction2();
		} else if (cmd.equals("member_idcheck")) {
			action = new MemberIdcheckAction();
		} else if (cmd.equals("member_idcheck2")) {
			action = new MemberIdcheckAction2();
		} else if (cmd.equals("member_idfound")) {
			action = new MemberidfoundAction();
		} else if (cmd.equals("member_idfound2")) {
			action = new MemberidfoundAction2();
		} else if (cmd.equals("member_pwfound")) {
			action = new MemberpwfoundAction();
		} else if (cmd.equals("member_pwfound2")) {
			action = new MemberpwfoundAction2();
		} else if (cmd.equals("member_authentication")) {
			action = new MembeAuthenticationAction();
		} else if (cmd.equals("member_authentication2")) {
			action = new MembeAuthenticationAction2();
		}
		return action;
	}
}