package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.UserVo;

public interface UserMapper {
	ArrayList<UserVo> findSameId(String userId);
	ArrayList<UserVo> findSameRn(String rn);
	ArrayList<UserVo> beforeLogin(UserVo vo);
}
