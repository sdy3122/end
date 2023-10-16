package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.UserDao;
import kr.co.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao dao;

	@Override
	public UserVo selectUserById(String id) {
		return dao.selectUserById(id);
	}

	@Override
	public List<UserVo> selectUserList() throws Exception{
		return dao.selectUserList();
	}

	@Override
	public void insertUser(UserVo vo) {
		dao.insertUser(vo);
	}

	@Override
	public void updateUser(UserVo vo) {
		dao.updateUser(vo);
	}

	@Override
	public int deleteUser(UserVo vo) {
		return dao.deleteUser(vo);
	}

	@Override
	public String findIdByNameRn(UserVo vo) {
		return dao.findIdByNameRn(vo);
	}

	@Override
	public String findPwByNameRn(UserVo vo) {
		return dao.findPwByNameRn(vo);
	}

}