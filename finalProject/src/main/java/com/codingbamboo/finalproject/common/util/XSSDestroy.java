package com.codingbamboo.finalproject.common.util;

import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public class XSSDestroy {
	private static final PolicyFactory policy = new HtmlPolicyBuilder()
			.allowElements("p","b","i","u","string","em","a","span")
			.allowAttributes("href","target","class").onElements("a")
			.allowAttributes("class","style").onElements("span")
			.allowStandardUrlProtocols()
			.toFactory();
	
	public static String destroy(String inputText) {
		return policy.sanitize(inputText);
	}
}