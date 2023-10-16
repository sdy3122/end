package kr.co.service;

import java.util.List;

import kr.co.vo.UserVo;

public interface UserService {
	List<UserVo> selectUserList() throws Exception;
	void updateUser(UserVo vo);
	String findPwByNameRn(UserVo vo);
	String findIdByNameRn(UserVo vo);
	int deleteUser(UserVo vo);
	void insertUser(UserVo vo);
	UserVo selectUserById(String id);
}