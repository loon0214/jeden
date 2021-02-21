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
	public void join(MemberVO member) throws Exception{
		sql.insert("join", member);
	}
}