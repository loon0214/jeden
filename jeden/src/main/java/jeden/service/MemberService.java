package jeden.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import jeden.mapper.dao.MemberDAO;
import jeden.vo.MemberVO;

@Service
public class MemberService {
	
//	@Resource(name ="jeden.mapper.BoardMapper")
	@Inject
	private MemberDAO manager;
	
	
	// check ID
	public void check_id(String id, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(manager.check_id(id));
		out.close();
	}
	
	// check_email
	public void check_email(String email, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(manager.check_email(email));
		out.close();
	}
	
	// Join	
	public int join(MemberVO member, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(manager.check_id(member.getId()) == 1) {
			out.println("<script>");
			out.println("alert('ID가 이미 존재합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (manager.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 Email이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			manager.join(member);
			return 1;
		}
	}
	
}