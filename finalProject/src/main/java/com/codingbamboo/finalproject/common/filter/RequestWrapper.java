package com.codingbamboo.finalproject.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.codingbamboo.finalproject.common.util.XSSDestroy;

public class RequestWrapper extends HttpServletRequestWrapper{

	public RequestWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String[] getParameterValues(String name) {
		String[] beforeParameters = super.getParameterValues(name);
		
		if(beforeParameters == null) {
			return null;
		}
		
		for(int i = 0; i < beforeParameters.length; i++) {
			beforeParameters[i] = XSSDestroy.destroy(beforeParameters[i]);
		}
		
		return beforeParameters;
	}
	
	@Override
	public String getParameter(String name) {
		String beforeParam = super.getParameter(name);
		
		if(beforeParam == null) {
			return null;
		}
		
		return XSSDestroy.destroy(beforeParam);
	}
	
	@Override
	public String getHeader(String name) {
		String beforeHeader = super.getHeader(name);
		
		if(beforeHeader == null) {
			return null;
		}
		
		return XSSDestroy.destroy(beforeHeader);
	}
}