package com.codingbamboo.finalproject.oauth.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.codingbamboo.finalproject.oauth.config.NaverConfig;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class NaverService {
	
	private final NaverConfig naverConfig;
	private final RestTemplate restTemplate;
	private final Gson gson;
	
	@Autowired
	public NaverService(NaverConfig naverConfig) {
		this.naverConfig = naverConfig;
		this.restTemplate = new RestTemplate();
		this.gson = new Gson();
	}
	
	public String getNaverUri(HttpServletRequest request, boolean link) {
		String redirectUri;
		if(link) {
			redirectUri = naverConfig.getLinkRedirectUri();
		}else {
			redirectUri = naverConfig.getLoginRedirectUri();
		}
		String state = UUID.randomUUID().toString();
		String apiUrl = String.format(
				"https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=%s&redirect_uri=%s&state=%s",
				naverConfig.getClientId(), redirectUri, state);
		request.getSession().setAttribute("state", state);
		return apiUrl;
	}
	
	public Map<String, Object> handleCallback(String code, String state, HttpSession session) {
        String storedState = (String) session.getAttribute("state");
        if (!storedState.equals(state)) {
        	System.out.println(state);
        	System.out.println(storedState);
            throw new IllegalStateException("CSRF ���°� ��ġ���� �ʽ��ϴ�.");
        }

        String tokenUrl = "https://nid.naver.com/oauth2.0/token";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", naverConfig.getClientId());
        params.add("client_secret", naverConfig.getClientSecret());
        params.add("code", code);
        params.add("state", state);

        HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(params, headers);
        ResponseEntity<String> tokenResponse = restTemplate.postForEntity(tokenUrl, tokenRequest, String.class);

        if (tokenResponse.getStatusCode() != HttpStatus.OK) {
            throw new RuntimeException("Failed to get access token from Naver");
        }

        JsonObject tokenJson = JsonParser.parseString(tokenResponse.getBody()).getAsJsonObject();
        String accessToken = tokenJson.get("access_token").getAsString();

        String profileUrl = "https://openapi.naver.com/v1/nid/me";
        HttpHeaders profileHeaders = new HttpHeaders();
        profileHeaders.set("Authorization", "Bearer " + accessToken);
        HttpEntity<String> profileRequest = new HttpEntity<>(profileHeaders);
        ResponseEntity<String> profileResponse = restTemplate.exchange(profileUrl, HttpMethod.GET, profileRequest, String.class);

        if (profileResponse.getStatusCode() != HttpStatus.OK) {
            throw new RuntimeException("Failed to get user profile from Naver");
        }

        JsonObject profileJson = JsonParser.parseString(profileResponse.getBody()).getAsJsonObject();
        JsonObject responseObject = profileJson.getAsJsonObject("response");

        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("id", responseObject.get("id").getAsString());
        return userInfo;
    }
}
