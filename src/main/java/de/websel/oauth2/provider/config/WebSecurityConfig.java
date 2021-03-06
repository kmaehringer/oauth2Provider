package de.websel.oauth2.provider.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;

import de.websel.oauth2.provider.service.CustomUserDetailsService;

@Configuration
@EnableOAuth2Client
class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	Logger log = LoggerFactory.getLogger(WebSecurityConfig.class);

	@Autowired
	private CustomUserDetailsService custom;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// @formatter:off
		http
			.authorizeRequests().antMatchers("/signin", "/login").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin().loginPage("/signin").loginProcessingUrl("/login").permitAll()
		;
		// @formatter:on
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(custom).passwordEncoder(passwordEncoder());
	}
}
