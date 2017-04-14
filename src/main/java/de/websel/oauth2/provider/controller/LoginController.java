package de.websel.oauth2.provider.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin(HttpServletRequest request) {
		return "signin";
	}
}
