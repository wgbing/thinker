package com.wgbing.thinker.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

@Configuration
public class Oauth2Config {

    @Value("${oauth2.client_id}")
    private String clientId;
    @Value("${oauth2.secret}")
    private String secret;
    @Value("${oauth2.oauth_url}")
    private String oauthUrl;
    @Value("${oauth2.request_and_refresh_token}")
    private String requestAndRefreshToken;


    @Bean
    public OAuth2RestOperations restTemplate(){
        AccessTokenRequest atr = new DefaultAccessTokenRequest();
        OAuth2RestTemplate template = new OAuth2RestTemplate(resourceDetails(), new DefaultOAuth2ClientContext(atr));
        ClientCredentialsAccessTokenProvider provider = new ClientCredentialsAccessTokenProvider();
        template.setAccessTokenProvider(provider);
        return template;
    }

    private ClientCredentialsResourceDetails resourceDetails(){
        ClientCredentialsResourceDetails resourceDetails = new ClientCredentialsResourceDetails();
        resourceDetails.setAccessTokenUri(oauthUrl+requestAndRefreshToken);
        resourceDetails.setScope(Arrays.asList("all"));// 读写权限
        resourceDetails.setGrantType("client_credentials");
        resourceDetails.setClientId(clientId);
        resourceDetails.setClientSecret(secret);
        return resourceDetails;
    }

}
