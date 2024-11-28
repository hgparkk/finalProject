package com.codingbamboo.finalproject.common.util;

import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public class XSSDestroy {
	// 사용자의 입력값에서 허용할 태그와 속성을 설정
	private static final PolicyFactory policy = new HtmlPolicyBuilder()
			.allowElements("p", "b", "u", "i", "strike", "sup", "sub", "blockquote", "a", "table", "tbody", "tr", "td",
					"span", "ol", "ul", "li")
			.allowAttributes("href", "target", "class").onElements("a")
			.allowAttributes("style", "align").onElements("p")
			.allowAttributes("style").onElements("span")
			.allowAttributes("class").onElements("blockquote")
			.allowAttributes("class","border","cellpadding","cellspacing","_se2_tbl_template","style").onElements("table")
			.allowAttributes("style","width").onElements("td")
			.allowStandardUrlProtocols().toFactory();

	public static String destroy(String inputText) {
		if (inputText == null) {
			return null;
		}

		// HTML 살균 처리 수행
		String sanitized = policy.sanitize(inputText);

		// 임시 토큰을 원래의 '@'와 '=' 문자로 복원
		sanitized = sanitized.replace("&#64;", "@");
		sanitized = sanitized.replace("&#61;", "=");
		sanitized = sanitized.replace("&#xfeff;", "");

		return sanitized;
	}
}