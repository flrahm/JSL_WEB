package com.library.util;

public class PageIndex {
	public static String pageList(int page, int totpage, String url, String addtag) {
		int idx_pre, idx_start;
		String s_pre = ""; //
		String s_idx = ""; //
		String s_next = "";//
		idx_start = ((page - 1) / 10) * 10 + 1;
		idx_pre = ((page - 1) / 10);

		if (idx_pre > 0) {
			s_pre = "<a href='" + url + "&page=" + (idx_pre * 10) + addtag + "'>"
					+ "<img src=img/i_prev.gif class='img3'></a>";
		} else {
			s_pre = "<img src=img/i_prev.gif class='img3'>";
		}

		for (int i = 0; i < 10; i++, idx_start++) {
			if (idx_start > totpage)
				break;
			if (idx_start == page)
				s_idx = s_idx + " " + idx_start + " ";
			else {
				s_idx = s_idx + " <a href='" + url + "&page=" + idx_start;
				s_idx = s_idx + addtag + "'>" + idx_start + " </a> ";
			}
		}

		if (idx_start <= totpage) {
			s_next = "<a href='" + url + "&page=" + idx_start + addtag + "'>"
					+ "<img src=img/i_next.gif class='img3'></a>";
		} else {
			s_next = " <img src=img/i_next.gif class='img3'>";
		}
		String outHtml = s_pre + s_idx + s_next; //
		return outHtml;
	}
}