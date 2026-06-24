package com.kdt.finalproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityJavaConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers(
                        "/", "/reg", "/login", "/reqLogin", "/main/", "/join",
                        "/infoma/", "/fmap/**", "/map/**",
                        "/support/notice", "/support/notice/**",
                        "/support/faq", "/support/review",
                        "/kakao/**", "/naver/**",
                        "/admin/**",
                        "/images/**", "/js/**", "/css/**",
                        "/**/*.jpg", "/**/*.png", "/**/*.js", "/**/*.css", "/**/*.svg"
                )
                .permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
                .and()
                .logout()
                .permitAll();
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
