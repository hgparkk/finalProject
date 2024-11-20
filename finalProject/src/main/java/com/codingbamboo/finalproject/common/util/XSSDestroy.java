package com.codingbamboo.finalproject.common.util;

import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public class XSSDestroy {
	private static final PolicyFactory policy = new HtmlPolicyBuilder()
			.allowElements("p", "b", "i", "u", "string", "em", "a", "span").allowAttributes("href", "target", "class")
			.onElements("a").allowAttributes("class", "style").onElements("span").allowStandardUrlProtocols()
			.allowTextIn("p", "b", "i", "u", "strong", "em", "a", "span").toFactory();

	public static String destroy(String inputText) {
		if (inputText == null) {
			return null;
		}

		String atSymbolToken = "##AT_SYMBOL##";
		String equalSignToken = "##EQUAL_SIGN##";
	    
	    // '@'와 '=' 문자를 임시 토큰으로 대체
	    inputText = inputText.replace("@", atSymbolToken);
	    inputText = inputText.replace("=", equalSignToken);

	    // HTML 살균 처리 수행
	    String sanitized = policy.sanitize(inputText);

	    // 임시 토큰을 원래의 '@'와 '=' 문자로 복원
	    sanitized = sanitized.replace(atSymbolToken, "@");
	    sanitized = sanitized.replace(equalSignToken, "=");
	    
	    return sanitized;
	}
}