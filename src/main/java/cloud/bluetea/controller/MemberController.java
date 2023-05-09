package cloud.bluetea.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.freemarker.SpringTemplateLoader;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cloud.bluetea.domain.Member;
import cloud.bluetea.domain.TicketVO;
import cloud.bluetea.mapper.MemberMapper;
import cloud.bluetea.service.CinemaService;
import cloud.bluetea.service.MemberService;
import cloud.bluetea.service.MessageService;
import cloud.bluetea.service.TicketService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

/**
 * packageName    : cloud.bluetea.controller
 * fileName       : MemberController
 * author         : 이재원
 * date           : 2023/04/25
 * description    : 사용자 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/05        이재원           파일생성
 * 2023/04/06        이재원           로그인 구현
 * 2023/04/10        이재원           휴대폰, 이메일 api 구현
 * 2023/04/12        이재원           마이페이지, 개인정보 수정 시작
 * 2023/04/12        이재원           회원 탈퇴 시작
 * 2023/04/13        이재원           Bcrypt 적용(로그인, 회원가입, 회원수정)
 * 2023/04/20        이재원           가입 완료 페이지 추가(signup_view)
 * 2023/04/25        이재원           약관동의 페이지 추가(signup_contract)
 */
@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("member")
@Data
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("login")
	public void login() {}
	@GetMapping("signup")
	public void signup() {}
	@GetMapping("signup_view")
	public void getsignup_view() {}
	@GetMapping("signup_contract")
	public void signup_contract() {}
	@GetMapping("mypage_ticket")
	public void mypageGet() {}	
	@GetMapping("mypage")
	public void mypagePost() {}	
	@GetMapping("mypage_modify")
	public void GETmodify() {}
	@GetMapping("mypage_remove")
	public void GETremove() {}
	
	// 입력한 값들을 mypage_modify로 보냄. 이 메서드에서 service 실행
	// 마이페이지 첫 화면
	@PostMapping("mypage")
	public String Postmypage(HttpServletRequest request,HttpSession session, Model model, RedirectAttributes rttr, Long tno) {
		log.info("mypage" + "메서드에 진입");
		TicketVO ticket = ticketService.getTicketByTno(tno);
		log.info(tno);
		log.info(ticket);
		
		return "member/mypage";
	};
	/**
	 * 받은 회원정보를 수정 & 업데이트 하기 전 비밀번호를 암호화 테스트 완료
	 * */
	@PostMapping("mypage_modify")
	public String Postmodify(HttpServletRequest request, Member member, HttpSession session, Model model, RedirectAttributes rttr) {
		log.info("modify Post 방식 메서드 진입" + member);
		// 넘어온 값들을 Member vo에 저장시켜 update.
		
		// 넘어온 Member 객체의 정보들 중 Pw만 가져온 후 암호화 하여 다시 저장하는 순서.
		member.setMemberPw(BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt()));
		memberService.modify(member);
		
		log.info("modify : " + member);
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		model.addAttribute("prevPage", prevPage);
		
		return "redirect:" + prevPage;
	};
	/**
	 * 회원 탈퇴 시 세션 초기화 후 index로 이동	 * 
	 * */
	@PostMapping("mypage_remove") 
	public String Postremove(HttpSession session, HttpServletRequest request, Member vo, RedirectAttributes rttr) {
		log.info("remove POST 메서드 진입");
		
		log.info("jsp에서 값이 제대로 넘어 왔다면 출력될 vo : " + vo);
		String pw = request.getParameter("memberPw");
		// login중인 회원의 정보를 Member객체에 가져온다.
		Member member = (Member)session.getAttribute("member");
		if(BCrypt.checkpw(pw, memberService.get(member.getMemberId()).getMemberPw())) {
			log.info("getAttribute 전의 Id : " + member);
			memberService.remove(member.getMemberId());
			
			log.info("getAttribute 후의 Id : " + member);
			session.invalidate();
			log.info("session.invalidate 후의 : " + member + "session : " + session);
		}
		return "redirect:/";
	}
	/** 
	 * 로그인 서비스 메서드 구현 순서
	 * POST방식 
	 * 로그인한 사용자의 비밀번호와 암호화된 사용자의 비밀번호가 일치하면 로그인 성공
	 * session에 "member"의 이름으로 저장.
	 * 현재 페이지에 남아있을 수 있게 getHeader 사용하여 이전 URL을 저장 후
	 * return에 redirect하여 사용.  
	 * */
	@PostMapping(value="login")
	@ResponseBody
	public String loginPOST(HttpServletRequest request,String memberId, Member member, RedirectAttributes rttr, Model model) throws Exception {		
		String pw = request.getParameter("memberPw");		
		Member memlog = memberService.login(member);		
		
		//첫번째 인자 : 사용자가 입력 두번째 인자 : DB에 저장된 값.
		if(BCrypt.checkpw(pw, memberService.get(memberId).getMemberPw())) { 
			// 세션 초기화
			HttpSession session = request.getSession();
			// 회원 정보를 session에 저장
			session.setAttribute("member", memberService.get(memberId));
			log.info(member);
			log.info("로그인 정보 memlog : " + memlog);
			// 이전페이지를 prevPage에 저장
			String prevPage = request.getHeader("Referer");
			// 이전페이지를 session에 저장
			session.setAttribute("prevPage", prevPage);
			// 리다이렉트할 URL을 FlashAttribute에 저장
			rttr.addFlashAttribute("prevPage", prevPage);
			log.info("로그인 성공");
		} 
		
		log.info(pw);
		// 로그인할때 필요한 정보가 없거나 checkpw가 false일때 로그인 실패.
		if (member == null) { // 로그인 실패			
			int result = 0;
			rttr.addFlashAttribute("result", result);
			log.info("로그인 실패 : " + member);
			return "false";
		} 

		// return할 url에 / 저장
		String url = "/";
		// 로그인 성공 후 사용할 flashprevPage에 prevPage(URL)을 가져옴.
		String flashprevPage = (String)rttr.getFlashAttributes().get("prevPage");
		
		log.info("prevPage: " + flashprevPage);
		url = "redirect:" + flashprevPage;
		return url;
	}
	/**
	 * signup.jsp의 input 란에 회원의 값이 Controller에 POST방식으로 접근하면서
	 * Controller의 register 쿼리 메서드 실행(이때 비밀번호는 암호화 후 DB에 저장된 것을 확인) 
	 * */
	// 회원가입 서비스
	@PostMapping({"signup", "signup_view"})
	public String signupPOST(HttpServletRequest request, Member member, RedirectAttributes rttr) throws Exception {
		log.info("POST isignup 메서드 진입");
		// 회원가입 전 암호화
		member.setMemberPw(BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt()));
		// 회원가입 서비스 실행
		memberService.register(member);
		log.info(member);
		
		return "member/signup_view";
	}
	
	/**
	 * ID중복검사 방법.
	 * 회원가입 시 회원의 Id를 비동기로 Controller에 보냄. 
	 * 그 후 String idchk에 초기화. DB에 있는 id의 중복여부를 검사하기 전
	 * Service, ServiceImpl, Mapper, Mapper.xml, MapperTests 검사완료.
	 * DB에서 중복검사 후 resultType이 int type으로 출력되며 1이상일 경우 return "false";
	 * jquery 유효성검사 idChk = false.
	 * */
	// ID 중복검사
	@PostMapping("memberIdChk")
	@ResponseBody
	public String signupidChk(HttpServletRequest request) throws Exception {
		String idchk = request.getParameter("memberId");
		log.info("id : " + idchk);
		//id 값을 result에 저장
		int result = memberService.idCheck(idchk);
		log.info("result :" + result);
		// 1이 아니면 중복.
		if(result != 0) {
			log.info("ID 중복");
			return "fail";
		} else {
			log.info("success 진입 " + result);
			return "success";
		}
	}	
	 /**
	  * 로그아웃 버튼 클릭 시 세션에 있는 값을 초기화 후 index로 이동
	  * */
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		// HttpServletRequest, HttpSession
		log.info("로그아웃");
		// session 초기화
		session.invalidate();
		return "redirect:/";
	}
	 /**
	  * 인증번호는 111111~999999에 임의의 번호로 인증번호 발송.
	  * */
	// 휴대폰 인증
	@PostMapping("sendMessage")
	@ResponseBody
	public Map<String, Object> send(HttpServletRequest request) {
		System.out.println("휴대폰 인증 post 메서드 진입");
		/**
		 * 인증받을 숫자를 랜덤 6자리 수, SMS 방식 input에서 값을 보내기 전, var code =""; 에 저장 후 유효성
		 * 검사에 활용할 예정
		 */
		Random random = new Random();
		int ranPhoneNum = random.nextInt(888888) + 111111;
		int authNum = ranPhoneNum; // 인증번호 설정
		
		System.out.println(authNum); // 인증번호 확인 시 사용
		messageService.sendMessage(request, Integer.toString(ranPhoneNum));
				
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("phonecode", authNum); // 인증 번호를 'phonecode' 키로 저장
	    return resultMap;
	}
	 /**
	  * java rib / smtp 사용
	  * */
	// 이메일 인증
	@PostMapping(value = "mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		// 넘어온 데이터 확인
		log.info("이메일 인증 메서드 진입");

		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 : " + checkNum);

		/**
		 * setForm은 반드시 필요. stmt설정한 계정만 보낼 수 있고 계정명은 임의로 바꿀 수 없음. gmail의 경우
		 * 별칭기능을 통해서 바꿀 수 있음. 반드시 필요하다면 사용 예정
		 */
		String setForm = "nhy3533@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다";
		String content = 
				"<h2>안녕하세요 반갑습니다</h2>" + "<br><br>" + "인증번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		
		return num;
	}
}