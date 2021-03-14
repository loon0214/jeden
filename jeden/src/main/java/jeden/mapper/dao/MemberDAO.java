package jeden.mapper.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import jeden.vo.MemberVO;

@Repository("jeden.mapper.dao.MemberDAO")
public class MemberDAO {
	
	@Inject
	SqlSession sql;
	
	// Join
	public void join(MemberVO vo) throws Exception{
		sql.insert("join", vo);
	}
	
	// login
	public MemberVO login(MemberVO vo) throws Exception{
		return sql.selectOne("login", vo);
	}
	
	// member update
	public void memberUpdate(MemberVO vo) throws Exception{
		sql.update("memberUpdate", vo);
	}
}