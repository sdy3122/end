package kr.co.mappers;

import java.util.ArrayList;
import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.SulVo;
import kr.co.vo.UserVo;

public interface SulMapper {
	ArrayList<SulVo> selectLikeBtnDesc();
	SulVo selectBno(long bno);
	int countSul();
	int selectByRegistNumber(long reg);
	List<SulVo> selectLimit(Criteria cri);
	ArrayList<SulVo> selectMyLikeBtnDesc(UserVo vo);
	int countMySul(UserVo vo);
	List<SulVo> selectMyLimit(Criteria cri);
	boolean insertBoard(SulVo sul);
	boolean updateBoard(SulVo sul);
	boolean deleteBoard(SulVo sul);
	String findSameBno(long bno);
	
	ArrayList<SulVo> selectSojuLikeBtnDesc();
	int countSoju();
	List<SulVo> selectSojuLimit(Criteria cri);
	
	ArrayList<SulVo> selectBeerLikeBtnDesc();
	int countBeer();
	List<SulVo> selectBeerLimit(Criteria cri);
	
	ArrayList<SulVo> selectWineLikeBtnDesc();
	int countWine();
	List<SulVo> selectWineLimit(Criteria cri);
	
	ArrayList<SulVo> selectVodkaLikeBtnDesc();
	int countVodka();
	List<SulVo> selectVodkaLimit(Criteria cri);
	
	ArrayList<SulVo> selectWhiskeyLikeBtnDesc();
	int countWhiskey();
	List<SulVo> selectWhiskeyLimit(Criteria cri);
	
	ArrayList<SulVo> selectFreeLikeBtnDesc();
	int countFree();
	List<SulVo> selectFreeLimit(Criteria cri);
}
