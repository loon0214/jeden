package jeden;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jeden.mapper.BoardMapper;

@Controller
public class JspTest {
	
	@Resource(name="jeden.mapper.BoardMapper")
	BoardMapper boardMapper;
	
	@RequestMapping("/test")
	private String jspTest() throws Exception {
		System.out.println(boardMapper.boardCount());
		return "test";
	}
}