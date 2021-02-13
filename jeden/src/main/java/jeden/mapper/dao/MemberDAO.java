package jeden.mapper.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import jeden.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sql;

	// check ID
	public int check_id(String id) throws Exception{
		return sql.selectOne("check_id", id);
	}
	
	// check Email
	public int check_email(String email) throws Exception{
		return sql.selectOne("check_email", email);
	}
	
	// Join
	@Transactional
	public int join(MemberVO member) throws Exception{
		return sql.insert("join", member);
	}
}
