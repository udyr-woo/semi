package cloud.bluetea.mapper;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.Member;
import cloud.bluetea.mapper.MemberMapper;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : MemberMapperTests
 * author         : 이재원
 * date           : 2023/04/24
 * description    : 멤버 서비스 Test
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/09        이재원           파일생성
 * 2023/04/10        이재원           회원 CRUD 기능 Test 완료
 * 2023/04/13        이재원           BCrypt 적용(insert, modify, login) 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Autowired
	private MemberMapper memberMapper;
	
	@Test
	public void testInsert() {
		Member member = new Member();
		member.setMemberId("id10");
		member.setMemberPw(BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt()));
		member.setMemberName("홍길동");
		member.setMemberNickname("더조은");
		member.setMemberPhoneNum(1234567890);
		member.setMemberEmail("aaaaa@aaaaa");
		memberMapper.insert(member);
		log.info(member);
	}

	// 회원 단일 조회
	@Test
	public void testRead() {
		String id = "id10";
		// log.info(memberMapper.read(member.getUserid()));
		// log.info(memberMapper.read(member.getUserid()));
		// log.info(member+"123123123123");
		// log.info(member.getUserid());
		// log.info(memberMapper.read(id));
		// memberMapper.read(id);
		log.info(memberMapper.read(id));
	}

	// 회원 전체조회
	@Test
	public void testGetList() {
		memberMapper.getList().forEach(log::info);
	}

	// 회원 수정
	@Test
	public void testUpdate() {
		// 회원 ID 조회
		Member vo = memberMapper.read("nhy3533");
		// Setter로 회원 정보 수정
		vo.setMemberName("nhy3533메소드테스트");
		vo.setMemberPw(BCrypt.hashpw(vo.getMemberPw(), BCrypt.gensalt()));
		vo.setMemberNickname("nhy3533메소드닉네임");
		// 수정된 정보 반영
		memberMapper.update(vo);
		// 반영된 id를 조회
		log.info(memberMapper.read("nhy3533"));
	}

	// 회원 탈퇴
	@Test
	public void testRemove() {
		// 회원 아이디 삭제
		memberMapper.remove("updateid");

		// 삭제한 회원 조회 실패
		memberMapper.read("updateid");
	}

	// 로그인
	@Test
	public void testLogin() {
		Member member = new Member();
		memberMapper.login(member);
		// 정상적인 ID, PW 입력 할때 조회 성공
		member.setMemberId("nhy3533");
//		member.setMemberPw("1234");
		// DB에 저장된 nhy3533의 Pw를 가져온다. // 그리고 해쉬화된 pw를 불러옴.
		if(BCrypt.checkpw(memberMapper.read("nhy3533").getMemberPw(), member.getMemberPw())) {
			memberMapper.login(member);
		} else {
			log.info("로그인 실패");
		}
		// 등록되지 않은 ID, PW 입력 시 결과 값 Null
		// member.setMemberId("id1123");
		// member.setMemberPw("123411");
		log.info("결과 값 : " + memberMapper.login(member));
	}

	// 아이디 중복검사
	@Test
	public void testIdChk() throws Exception {
		String id = "id1"; // 존재하는 id
		String id1 = "newid1"; // 존재하지 않는 아이디
		
		memberMapper.idCheck(id);
		memberMapper.idCheck(id1);
		
	}
}


