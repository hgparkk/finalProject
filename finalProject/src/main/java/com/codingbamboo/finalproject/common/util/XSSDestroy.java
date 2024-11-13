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

		// '@' 문자를 임시 토큰으로 대체
		String tempToken = "##AT_SYMBOL##";
		inputText = inputText.replace("@", tempToken);

		// HTML 살균 처리
		String sanitized = policy.sanitize(inputText);

		// 임시 토큰을 다시 '@'로 변환
		sanitized = sanitized.replace(tempToken, "@");

		return sanitized;
	}
}