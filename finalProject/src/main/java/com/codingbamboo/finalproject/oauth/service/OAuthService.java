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

import com.codingbamboo.finalproject.oauth.config.GoogleConfig;
import com.codingbamboo.finalproject.oauth.config.KakaoConfig;
import com.codingbamboo.finalproject.oauth.config.NaverConfig;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class OAuthService {
	private final NaverConfig naverConfig;
	private final KakaoConfig kakaoConfig;
	private final GoogleConfig googleConfig;
	private final RestTemplate restTemplate;

	@Autowired
	public OAuthService(NaverConfig naverConfig, KakaoConfig kakaoConfig, GoogleConfig googleConfig) {
		this.naverConfig = naverConfig;
		this.kakaoConfig = kakaoConfig;
		this.googleConfig = googleConfig;
		this.restTemplate = new RestTemplate();
	}

	// 접근하기 위한 uri 가져오기
	public String getUri(HttpServletRequest request, boolean link, String provider) {
		String redirectUri = "";
		String apiUrl = "";
		String state = UUID.randomUUID().toString();
		if (provider.equalsIgnoreCase("Naver")) {
			if (link) {
				redirectUri = naverConfig.getLinkRedirectUri();
			} else {
				redirectUri = naverConfig.getLoginRedirectUri();
			}
			apiUrl = String.format(
					"https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=%s&redirect_uri=%s&state=%s",
					naverConfig.getClientId(), redirectUri, state);
			request.getSession().setAttribute("naverState", state);
		} else if (provider.equalsIgnoreCase("Kakao")) {
			if (link) {
				redirectUri = kakaoConfig.getLinkRedirectUri();
			} else {
				redirectUri = kakaoConfig.getLoginRedirectUri();
			}
			apiUrl = String.format(
					"https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=%s&redirect_uri=%s&state=%s",
					kakaoConfig.getClientId(), redirectUri, state);
			request.getSession().setAttribute("kakaoState", state);
		} else if (provider.equalsIgnoreCase("Google")) {
			if (link) {
				redirectUri = googleConfig.getLinkRedirectUri();
			} else {
				redirectUri = googleConfig.getLoginRedirectUri();
			}
			apiUrl = String.format(
					"https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=%s&redirect_uri=%s&scope=openid&state=%s",
					googleConfig.getClientId(), redirectUri, state);
			request.getSession().setAttribute("googleState", state);
		} else {
			throw new IllegalArgumentException("Unknown provider:" + provider);
		}
		return apiUrl;
	}

	// 콜백 처리 함수
	public Map<String, Object> handleCallback(String code, String state, boolean link, HttpSession session,
			String provider) {
		String storedState = "";
		if(provider.equalsIgnoreCase("Naver")) {
			storedState = (String) session.getAttribute("naverState");
		}else if(provider.equalsIgnoreCase("Kakao")) {
			storedState = (String) session.getAttribute("kakaoState");
		}else if(provider.equalsIgnoreCase("Google")) {
			storedState = (String) session.getAttribute("googleState");
		}
		if (!storedState.equals(state)) {
			throw new IllegalStateException("CSRF 상태가 일치하지 않습니다.");
		}
		String accessToken = getAccessToken(code, state, link, provider);
		return getUserInfo(accessToken, provider);
	}

	private String getAccessToken(String code, String state, boolean link, String provider) {
		String tokenUrl = "";
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		// 네이버 토큰 요청 url 만들기
		if (provider.equalsIgnoreCase("Naver")) {
			tokenUrl = "https://nid.naver.com/oauth2.0/token";
			params.add("grant_type", "authorization_code");
			params.add("client_id", naverConfig.getClientId());
			params.add("client_secret", naverConfig.getClientSecret());
			params.add("code", code);
			params.add("state", state);
			// 카카오 토큰 요청 url 만들기
		} else if (provider.equalsIgnoreCase("Kakao")) {
			tokenUrl = "https://kauth.kakao.com/oauth/token";
			params.add("grant_type", "authorization_code");
			params.add("client_id", kakaoConfig.getClientId());
			if (link) {
				params.add("redirect_uri", kakaoConfig.getLinkRedirectUri());
			} else {
				params.add("redirect_uri", kakaoConfig.getLoginRedirectUri());
			}
			params.add("client_secret", kakaoConfig.getClientSecret());
			params.add("code", code);
		}else if(provider.equalsIgnoreCase("Google")) {
			tokenUrl = "https://oauth2.googleapis.com/token";
			params.add("grant_type", "authorization_code");
			params.add("client_id", googleConfig.getClientId());
			if (link) {
				params.add("redirect_uri", googleConfig.getLinkRedirectUri());
			} else {
				params.add("redirect_uri", googleConfig.getLoginRedirectUri());
			}
			params.add("client_secret", googleConfig.getClientSecret());
			params.add("code", code);
		} else {
			throw new IllegalArgumentException("Unknown provider:" + provider);
		}

		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(params, headers);
		ResponseEntity<String> tokenResponse = restTemplate.postForEntity(tokenUrl, tokenRequest, String.class);

		if (tokenResponse.getStatusCode() != HttpStatus.OK) {
			throw new RuntimeException("Failed to get access token");
		}

		JsonObject tokenJson = JsonParser.parseString(tokenResponse.getBody()).getAsJsonObject();
		return tokenJson.get("access_token").getAsString();
	}

	// 사용자 정보 요청
	private Map<String, Object> getUserInfo(String accessToken, String provider) {

		String profileUrl = "";
		HttpHeaders profileHeaders = new HttpHeaders();
		profileHeaders.set("Authorization", "Bearer " + accessToken);
		HttpEntity<String> profileRequest = new HttpEntity<>(profileHeaders);

		if (provider.equalsIgnoreCase("Naver")) {
			profileUrl = "https://openapi.naver.com/v1/nid/me";
		} else if (provider.equalsIgnoreCase("Kakao")) {
			profileUrl = "https://kapi.kakao.com/v2/user/me";
		} else if (provider.equalsIgnoreCase("Google")) {
			profileUrl = "https://openidconnect.googleapis.com/v1/userinfo";
		} else {
			throw new IllegalArgumentException("Unknown provider:" + provider);
		}

		ResponseEntity<String> profileResponse = restTemplate.exchange(profileUrl, HttpMethod.GET, profileRequest,
				String.class);

		if (profileResponse.getStatusCode() != HttpStatus.OK) {
			throw new RuntimeException("Failed to get user profile from " + provider);
		}

		JsonObject profileJson = JsonParser.parseString(profileResponse.getBody()).getAsJsonObject();
		Map<String, Object> userInfo = new HashMap<>();

		if (provider.equalsIgnoreCase("Naver")) {
			JsonObject responseObject = profileJson.getAsJsonObject("response");
			userInfo.put("id", responseObject.get("id").getAsString());
		} else if (provider.equalsIgnoreCase("Kakao")) {
			userInfo.put("id", profileJson.get("id").getAsString());
		} else if (provider.equalsIgnoreCase("Google")) {
			userInfo.put("id", profileJson.get("sub").getAsString());
		}
		return userInfo;
	}
}