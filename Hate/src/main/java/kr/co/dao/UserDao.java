package kr.co.dao;

import java.util.List;
import kr.co.vo.UserVo;

public interface UserDao {
	UserVo selectUserById(String id);
	List<UserVo> selectUserList() throws Exception;
	void insertUser(UserVo vo);
	void updateUser(UserVo vo);
	int deleteUser(UserVo vo);
	String findIdByNameRn(UserVo vo);
	String findPwByNameRn(UserVo vo);
}