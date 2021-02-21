package jeden.controller;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jeden.service.MemberService;
import jeden.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService memberService;
	
	// Join get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getJoin() throws Exception{
		logger.info("get Join");
	}
	
	// join post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postJoin(MemberVO member) throws Exception{
		logger.info("post Join");
		
		memberService.join(member);
		
		return "redirect:/board/boardList";
	}
}