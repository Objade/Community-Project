package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired 
	private MemberService memberService;
	
	@Value("classpath:agreement/agreement.txt")
	private Resource agreement;
	
	
	@GetMapping("/join")
	public ModelAndView join(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		File f = agreement.getFile();
		Scanner sc = new Scanner(f);
		String agreement = "";

		while(sc.hasNextLine()) {
			agreement += sc.nextLine();
			agreement += "\n";
		}
		sc.close();
		
		mav.addObject("agreement", agreement);
		
		return mav;
	}
	
	@PostMapping("/join")
	public String join(MemberDTO dto) {
		int row = memberService.addMember(dto);
		System.out.println(row != 0 ? "추가 성공" : "추가 실패");
		
		return "redirect:/";
	}
	
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, String url, HttpSession session, HttpServletRequest request) {
		MemberDTO login = memberService.login(dto);
		
		session.setAttribute("login", login);
		
//		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
//		String ip = req.getHeader("X-FORWARED-FOR");
//		
//		if(ip == null) {
//			ip = req.getRemoteAddr();
//		}
		
		String ip = request.getRemoteAddr();
		
		session.setAttribute("ip", ip);
		
		return "redirect:" + (url != null ? url : "/") ;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public void mypage() {}
	
	@GetMapping("/modify")
	public void modify() {}
	
	@PostMapping("/modify")
	public String modify(MemberDTO dto, HttpSession session) {

		int row = memberService.modify(dto);
		if(row != 0) {
			MemberDTO login = memberService.getMember(dto.getUserid());
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(600);
		}
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		return "redirect:/member/mypage";
	}
	
	@GetMapping("/withdraw")
	public String withdraw(HttpSession session) {
		String userid = ((MemberDTO) session.getAttribute("login")).getUserid();
		int row = memberService.withdraw(userid);
		System.out.println(row != 0 ? "탈퇴 성공" : "탈퇴 실패");
		if(row != 0) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	
	
}
