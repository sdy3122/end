package kr.co.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mappers.SulMapper;
import kr.co.mappers.UserMapper;
import kr.co.vo.Criteria;
import kr.co.vo.PagingVo;
import kr.co.vo.SulVo;
import kr.co.vo.UserVo;

@Controller
public class BoardController {
	@Autowired
	private SulMapper sulMapper;
	@Autowired
	private UserMapper userMapper;
	
	@GetMapping("boardPage")
	public ModelAndView boardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/boardPage");
		ArrayList<SulVo> alLike = sulMapper.selectLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countSul();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		
		System.out.println(pagingVo.getStartPage());
		System.out.println(pagingVo.getCri().getPerPageNum());
		return mav;
	}
	
	@GetMapping("singleBoardPage")
	public ModelAndView boardPage(Model model, Criteria cri, PagingVo pagingVo
			, SulVo sulVo, @RequestParam long idx) throws Exception {
		ModelAndView mav = new ModelAndView("/singleBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countSul();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		System.out.println("선택한 게시글 bno는? " + idx);
		sulVo = sulMapper.selectBno(idx);
		// 목록에서 색깔로 위치표시하기위함
		model.addAttribute("idx", idx);
		model.addAttribute("showBoard", sulVo);
		return mav;
	}
	
	@GetMapping("boardLoginPage")
	public String loginPage(Model model) {
		System.out.println("게시판에세 로그인하러감");
		model.addAttribute("checkPath", 990122);
		return "loginPage";
	}
	
	@RequestMapping(value = "/boardLogout")
	public String logoutAfter(HttpSession session, HttpServletRequest req) {
		session = req.getSession(false);
		session.invalidate();
		System.out.println("게시판에서 로그아웃 ㅅㄱ");
		return "redirect:/boardPage";
	}
	
	@GetMapping("myBoardPage")
	public ModelAndView myBoardPage(HttpSession session, UserVo vo, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/myBoardPage");
		vo = (UserVo) session.getAttribute("sessionVo");
		
		int total = sulMapper.countMySul(vo);
		cri.setName(vo.getUserName());
		cri.setRegistNumber(vo.getRegistNumber());
		
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectMyLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		System.out.println(pagingVo.getStartPage());
		System.out.println(pagingVo.getCri().getPerPageNum());
		return mav;
	}
	
	@GetMapping("otherBoardPage")
	public ModelAndView otherBoardPage(UserVo vo, Criteria cri, PagingVo pagingVo,
			@RequestParam long idx) throws Exception {
		ModelAndView mav = new ModelAndView("/otherBoardPage");

		System.out.println("남의 게시판 bno는? " + idx);
		String regNum = sulMapper.findSameBno(idx);
		
		System.out.println(regNum);
		vo = userMapper.findSameRn(regNum).get(0);

		int total = sulMapper.countMySul(vo);
		System.out.println("이사람의 총 게시글 수는?" + total);
		
		cri.setName(vo.getUserName());
		cri.setRegistNumber(vo.getRegistNumber());

		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);

		List<SulVo> list = sulMapper.selectMyLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		System.out.println(pagingVo.getStartPage());
		System.out.println(pagingVo.getCri().getPerPageNum());
		return mav;
	}
	
	@RequestMapping(value = "/createBoard")
	public String createBoard() {
		System.out.println("글쓰러 가기");
		return "createBoard";
	}
	
	@GetMapping(value = "/insertBoard")
	public String insertBoard(HttpSession session, UserVo vo, HttpServletRequest req,
			SulVo sulvo, @RequestParam String choiceSulType, @RequestParam String title,
			@RequestParam String menu, @RequestParam String content) {
		System.out.println("게시글 등록하러 옴");
		vo = (UserVo) session.getAttribute("sessionVo");
		
		sulvo.setSul(choiceSulType);
		sulvo.setWriter(vo.getUserName());
		sulvo.setRegistNumber(vo.getRegistNumber());
		sulvo.setMenu(menu);
		sulvo.setTitle(title);
		sulvo.setContent(content);
		
		boolean sF = sulMapper.insertBoard(sulvo);
		System.out.println(sF);
		
		return "redirect:/boardPage";
	}
	
	@RequestMapping(value = "/changeBoard")
	public String changeBoard(@RequestParam long editBoardBno, SulVo sul,
			Model model) {
		System.out.println("글 수정하러 가기");
		sul = sulMapper.selectBno(editBoardBno);
		model.addAttribute("boardForEdit",sul);
		return "changeBoard";
	}
	
	@GetMapping(value = "/updateBoard")
	public String updateBoard(HttpSession session, UserVo vo, HttpServletRequest req,
			SulVo sulvo, @RequestParam String choiceSulType, @RequestParam String title,
			@RequestParam String menu, @RequestParam String content, @RequestParam long hiddenBnoAway) {
		System.out.println("게시글 수정하러 옴");
		vo = (UserVo) session.getAttribute("sessionVo");
		
		sulvo.setBno(hiddenBnoAway);
		sulvo.setSul(choiceSulType);
		sulvo.setMenu(menu);
		sulvo.setTitle(title);
		sulvo.setContent(content);
		
		boolean sF = sulMapper.updateBoard(sulvo);
		System.out.println(sF);
		
		return "redirect:/boardPage";
	}
	
	@RequestMapping(value = "/deleteBoard")
	public String deleteBoard(@RequestParam long deleteBoardBno, SulVo sul) {
		System.out.println("글 삭제함 ㅅㄱ");
		sul = sulMapper.selectBno(deleteBoardBno);
		boolean sF = sulMapper.deleteBoard(sul);
		System.out.println(sF);
		return "redirect:/boardPageAfter";
	}
	
	@GetMapping("boardPageAfter")
	public ModelAndView boardPageAfter(HttpServletResponse res, Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/boardPage");
		ScriptUtils.alertJust(res, "글이 삭제 되었습니다...");
		ArrayList<SulVo> alLike = sulMapper.selectLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countSul();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		
		System.out.println(pagingVo.getStartPage());
		System.out.println(pagingVo.getCri().getPerPageNum());
		return mav;
	}
	
	@GetMapping("sojuBoardPage")
	public ModelAndView sojuBoardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/sojuBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectSojuLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countSoju();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectSojuLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		return mav;
	}
	
	@GetMapping("beerBoardPage")
	public ModelAndView beerBoardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/beerBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectBeerLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countBeer();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectBeerLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		return mav;
	}
	
	@GetMapping("wineBoardPage")
	public ModelAndView wineBoardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/wineBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectWineLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countWine();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectWineLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		return mav;
	}
	
	@GetMapping("vodkaBoardPage")
	public ModelAndView vodkaBoardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/vodkaBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectVodkaLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countVodka();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectVodkaLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		return mav;
	}
	
	@GetMapping("whiskeyBoardPage")
	public ModelAndView whiskeyBoardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/whiskeyBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectWhiskeyLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countWhiskey();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectWhiskeyLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		return mav;
	}
	
	@GetMapping("freeBoardPage")
	public ModelAndView freeBoardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/freeBoardPage");
		ArrayList<SulVo> alLike = sulMapper.selectFreeLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countFree();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectFreeLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		return mav;
	}
}
