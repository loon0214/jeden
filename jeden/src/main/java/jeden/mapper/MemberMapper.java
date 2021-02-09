package jeden.mapper;

import javax.servlet.http.HttpServletResponse;

import jeden.vo.MemberVO;

public interface MemberMapper {
	
//	public int check_id(MemberVO member) throws Exception;
	public void check_id(String id, HttpServletResponse response) throws Exception;
	public void check_email(String email, HttpServletResponse response) throws Exception;
	public int join(MemberVO member, HttpServletResponse response) throws Exception;
//	public void sendEmail(MemberVO vo, String div) throws Exception; //이메일발송
//	public void find_pw(HttpServletResponse resp, MemberVO vo) throws Exception; //비밀번호찾기
	
	
}
