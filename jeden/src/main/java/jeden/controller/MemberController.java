package jeden.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jeden.service.MemberService;
import jeden.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;
	
	// Join get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getJoin() throws Exception{
		logger.info("get Join");
	}
	
	// join post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postJoin(MemberVO member) throws Exception{
		logger.info("post Join");
		
		service.join(member);
		
		return "redirect:/board/boardList";
	}
	
	// login
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = request.getSession();
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		return "redirect:/board/boardList";
	}
	
	//logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
}