package jeden.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import jeden.mapper.dao.MemberDAO;
import jeden.vo.MemberVO;

@Service
public class MemberService {
	
	@Inject
	MemberDAO dao;
	
	// Join
	public void join(MemberVO vo) throws Exception{
		dao.join(vo);
	}
	
	// login
	public MemberVO login(MemberVO vo) throws Exception{
		return dao.login(vo);
	}
}