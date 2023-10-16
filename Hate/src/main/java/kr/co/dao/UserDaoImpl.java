package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String Namespace = "kr.co.mybatis.mappers.UserMapper";

	@Override
	public UserVo selectUserById(String id) {
		return sqlSession.selectOne(Namespace + ".selectUserById", id);
	}

	@Override
	public List<UserVo> selectUserList() {
		return sqlSession.selectList(Namespace + ".selectUserList");
	}

	@Override
	public void insertUser(UserVo vo) {
		sqlSession.update(Namespace + ".insertUser", vo);
	}

	@Override
	public void updateUser(UserVo vo) {
		sqlSession.update(Namespace + ".updateUser", vo);
	}

	@Override
	public int deleteUser(UserVo vo) {
		return sqlSession.update(Namespace + ".deleteUser", vo);
	}

	@Override
	public String findIdByNameRn(UserVo vo) {
		return sqlSession.selectOne(Namespace + ".findIdByNameRn", vo);
	}

	@Override
	public String findPwByNameRn(UserVo vo) {
		return sqlSession.selectOne(Namespace + ".findPwByNameRn", vo);
	}

}