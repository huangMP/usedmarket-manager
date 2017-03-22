package com.fh.entity;

import java.util.List;

import com.fh.util.PageData;

public class PageBean extends Page {
	
	private List<PageData> pds;

	public List<PageData> getPds() {
		return pds;
	}

	public void setPds(List<PageData> pds) {
		this.pds = pds;
	}

	
}
