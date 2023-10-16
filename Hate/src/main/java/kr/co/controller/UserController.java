package kr.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mappers.SulMapper;
import kr.co.mappers.UserMapper;
import kr.co.service.UserService;
import kr.co.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private SulMapper sulMapper;
	
	@GetMapping(value = { "/", "index" })
	public String home(Model model) {
		return "index";
	}
	
	@GetMapping("findIdPage")
	public String findIdPage() {
		return "findIdPage";
	}
	
	@GetMapping("findPwPage")
	public String findPwPage() {
		return "findPwPage";
	}
	
	@GetMapping("loginPage")
	public String loginPage(Model model) {
		model.addAttribute("checkPath", 0);
		return "loginPage";
	}
	
	@GetMapping("registPage")
	public String registPage() {
		return "registPage";
	}
	
	@GetMapping("myInfoPage")
	public String myInfoPage(HttpServletRequest req, HttpSession session, UserVo vo) {
		session = req.getSession(false);
		vo = (UserVo) session.getAttribute("sessionVo");
		int writeCnt = sulMapper.selectByRegistNumber(vo.getRegistNumber());
		session.setAttribute("cnt", writeCnt);
		return "myInfoPage";
	}
	
	@GetMapping("myInfoEdit")
	public String myInfoEdit() {
		return "myInfoEdit";
	}
	
	@GetMapping("deleteInfoPage")
	public String deleteInfoPage() {
		return "deleteInfoPage";
	}
	
	@GetMapping("choiceSulPage")
	public String choiceSulPage() {
		return "choiceSulPage";
	}

	@PostMapping("/regist")
	public String registAfter(UserVo vo,@RequestParam String userName, @RequestParam String userId, @RequestParam String userPw,
			@RequestParam("rn1") String rnString1, @RequestParam("rn2") String rnString2, HttpServletRequest req) {
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserName(userName);
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		vo.setRegistNumber(rnN);
		service.insertUser(vo);

		return "index";
	}
	
	@ResponseBody
	@PostMapping("/loginCheck")
	public int loginCheck(UserVo vo, HttpServletRequest req, @RequestParam String reqId, @RequestParam String reqPw) {
		vo.setUserId(reqId);
		vo.setUserPw(reqPw);
		int passOrNo = userMapper.beforeLogin(vo).size();
		System.out.println(passOrNo);
		return passOrNo;
	}

	@PostMapping("/login")
	public String loginAfter(HttpSession session, UserVo vo, @RequestParam String userId, @RequestParam String userPw
			, HttpServletRequest req, @RequestParam int pathChoiceNum) {
		vo = service.selectUserById(userId);
		if (vo != null) {
			System.out.println("아이디일치!!!!!!");
			if (vo.getUserPw().equals(userPw)) {
				System.out.println("로그인 성공!!!!!!!");
				session = req.getSession(false);
				session.setAttribute("sessionVo", vo);
				session.setAttribute("check", true);
				
				int writeCnt = sulMapper.selectByRegistNumber(vo.getRegistNumber());
				session.setAttribute("cnt", writeCnt);
			} else {
				System.out.println("아이디 일치, 비밀번호 틀림 ㅅㄱ");
				return "loginFail";
			}
		} else {
			System.out.println("해당아이디없음 ㅅㄱ");
			return "loginFail";
		}
		if (pathChoiceNum == 0) {
			return "index";
		} else {
			return "redirect:boardPage";
		}
	}

	@RequestMapping(value = "/logout")
	public String logoutAfter(HttpSession session, HttpServletRequest req) {
		session = req.getSession(false);
		session.invalidate();
		System.out.println("로그아웃 ㅅㄱ");
		return "index";
	}

	@RequestMapping(value = "/deleteInfo")
	public void deleteAfter(UserVo vo, HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		vo = (UserVo) session.getAttribute("sessionVo");
		if (service.deleteUser(vo) > 0) {
			System.out.println("회원탈퇴함");
			session.invalidate();
			ScriptUtils.alert(res, "회원탈퇴 되었습니다...", "index");
		} else {
			System.out.println("회원탈퇴안됨 ㄷㄷ");
			ScriptUtils.alert(res, "회원탈퇴 실패, 다시시도", "deleteInfoPage");
		}
	}

	@ResponseBody
	@PostMapping("/pwCheck")
	public int pwCheck(HttpSession session, HttpServletRequest req, @RequestParam String reqPw) {
		session = req.getSession(false);
		UserVo vo = (UserVo) session.getAttribute("sessionVo");
		String nowPw = vo.getUserPw();
		if (nowPw.equals(reqPw)) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@PostMapping("/userInfoEdit")
	public String infoEdit(UserVo vo, HttpSession session, HttpServletRequest req, @RequestParam String userPw) {
		session = req.getSession(false);
		vo = (UserVo) session.getAttribute("sessionVo");
		vo.setUserPw(userPw);
		service.updateUser(vo);
		System.out.println("비밀변호 변경됨..");
		return "index";
	}

	@PostMapping("/findId")
	public String findId(UserVo vo, @RequestParam String userName, @RequestParam("rn1") String rnString1,
		@RequestParam("rn2") String rnString2, Model model) {
		vo = new UserVo();
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserName(userName);
		vo.setRegistNumber(rnN);
		
		String findID = service.findIdByNameRn(vo);
		if (findID != null) {
			System.out.println("해당정보로 나온 아이디있음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			model.addAttribute("findId", findID);
			return "findSuccessId";
		} else {
			System.out.println("그런 계정없음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			return "findFailId";
		}
	}

	@PostMapping("/findPw")
	public String findPw(UserVo vo, @RequestParam String userName, @RequestParam String userId, @RequestParam("rn1") String rnString1,
		@RequestParam("rn2") String rnString2, Model model) {
		vo = new UserVo();
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserId(userId);
		vo.setUserName(userName);
		vo.setRegistNumber(rnN);
		
		String findPW = service.findPwByNameRn(vo);
		if (findPW != null) {
			System.out.println("해당정보로 나온 비밀번호있음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			model.addAttribute("inputId", userId);
			model.addAttribute("findPw", findPW);
			return "findSuccessPw";
		} else {
			System.out.println("그런 계정없음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			model.addAttribute("inputId", userId);
			return "findFailPw";
		}
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(HttpServletRequest req) {
		String id = req.getParameter("sdy");
		int countDupId = userMapper.findSameId(id).size();
		return countDupId;
	}

	@ResponseBody
	@PostMapping("/rnCheck")
	public int rnCheck(HttpServletRequest req) {
		String rn = req.getParameter("checkRegistNumber");
		int countDupRn = userMapper.findSameRn(rn).size();
		return countDupRn;
	}
	
//	@ResponseBody
//	@PostMapping("/sojuFood")
//	public List<SojuVo> sojuFood(HttpServletRequest req) {
//		System.out.println("소주 안주 찾으러 옴");
//		List<SojuVo> menuList = sojuMapper.selectDistinctSojuList();
//		for (int i = 0; i < menuList.size(); i++) {
//			System.out.println(menuList.get(i));
//		}
//		return menuList;
//	}
//	
//	@ResponseBody
//	@PostMapping("/beerFood")
//	public List<BeerVo> beerFood(HttpServletRequest req) {
//		System.out.println("맥주 안주 찾으러 옴");
//		List<BeerVo> menuList = beerMapper.selectDistinctBeerList();
//		for (int i = 0; i < menuList.size(); i++) {
//			System.out.println(menuList.get(i));
//		}
//		return menuList;
//	}
//	
//	@ResponseBody
//	@PostMapping("/wineFood")
//	public List<WineVo> wineFood(HttpServletRequest req) {
//		System.out.println("와인 안주 찾으러 옴");
//		List<WineVo> menuList = wineMapper.selectDistinctWineList();
//		for (int i = 0; i < menuList.size(); i++) {
//			System.out.println(menuList.get(i));
//		}
//		return menuList;
//	}
//	
//	@ResponseBody
//	@PostMapping("/vodkaFood")
//	public List<VodkaVo> vodkaFood(HttpServletRequest req) {
//		System.out.println("보드카 안주 찾으러 옴");
//		List<VodkaVo> menuList = vodkaMapper.selectDistinctVodkaList();
//		for (int i = 0; i < menuList.size(); i++) {
//			System.out.println(menuList.get(i));
//		}
//		return menuList;
//	}
//	
//	@ResponseBody
//	@PostMapping("/whiskeyFood")
//	public List<WhiskeyVo> whiskeyFood(HttpServletRequest req) {
//		System.out.println("위스키 안주 찾으러 옴");
//		List<WhiskeyVo> menuList = whiskeyMapper.selectDistinctWhiskeyList();
//		for (int i = 0; i < menuList.size(); i++) {
//			System.out.println(menuList.get(i));
//		}
//		return menuList;
//	}
}