package jeden.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import jeden.mapper.dao.MemberDAO;
import jeden.vo.MemberVO;

@Service
public class MemberService {
	
	@Inject
	MemberDAO dao;
	
	public void join(MemberVO member) throws Exception{
		dao.join(member);
		
	}
}