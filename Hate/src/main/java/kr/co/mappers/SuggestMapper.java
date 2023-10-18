package kr.co.mappers;

import java.util.ArrayList;
import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.SuggestVo;

public interface SuggestMapper {
	boolean insertSuggest(SuggestVo vo);
	int countSuggest();
	List<SuggestVo> selectSuggestLimit(Criteria cri);
	ArrayList<SuggestVo> selectSuggestLikeBtnDesc();
}
