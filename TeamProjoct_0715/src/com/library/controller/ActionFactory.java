package com.library.controller;

import com.library.action.Action;

public interface ActionFactory {
	public Action getAction(String cmd);
}