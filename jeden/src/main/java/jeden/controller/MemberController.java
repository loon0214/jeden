package jeden.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jeden.service.MemberService;
import jeden.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// Join Form
	@RequestMapping(value = "/join")
	public String join() throws Exception{
		return "/member/join";
	}
	
	// Join
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVO member, RedirectAttributes rttr,
			HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", memberService.join(member, response));
		return "redirect:../board/boardList";
	}
	
	// ID check
	@RequestMapping(value = "/check_id", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		memberService.check_id(id, response);
	}
	
	// Email check
	@RequestMapping(value = "/check_email", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		memberService.check_email(email, response);
	}

	
}
