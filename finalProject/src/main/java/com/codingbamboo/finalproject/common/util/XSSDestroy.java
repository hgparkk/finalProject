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

		// '@' ���ڸ� �ӽ� ��ū���� ��ü
		String tempToken = "##AT_SYMBOL##";
		inputText = inputText.replace("@", tempToken);

		// HTML ��� ó��
		String sanitized = policy.sanitize(inputText);

		// �ӽ� ��ū�� �ٽ� '@'�� ��ȯ
		sanitized = sanitized.replace(tempToken, "@");

		return sanitized;
	}
}