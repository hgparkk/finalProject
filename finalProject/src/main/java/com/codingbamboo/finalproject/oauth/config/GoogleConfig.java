package com.codingbamboo.finalproject.oauth.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:spring/appconfig.properties")
public class GoogleConfig {

	@Value("${google.client-id}")
	private String clientId;
	
	@Value("${google.client-secret}")
	private String clientSecret;

	@Value("${google.link-redirect-uri}")
	private String linkRedirectUri;

	@Value("${google.login-redirect-uri}")
	private String loginRedirectUri;

	public String getClientId() {
		return clientId;
	}
	
	public String getClientSecret() {
		return clientSecret;
	}

	public String getLinkRedirectUri() {
		return linkRedirectUri;
	}

	public String getLoginRedirectUri() {
		return loginRedirectUri;
	}
}