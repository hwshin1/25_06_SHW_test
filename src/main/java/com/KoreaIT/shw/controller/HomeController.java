package com.KoreaIT.shw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/home/main")
	public String main() {
		return "/home/main";
	}
	
	@RequestMapping("/")
	public String showMain() {
		return "redirect:/home/main";
	}
}
