package cloud.bluetea.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cloud.bluetea.domain.Member;
import cloud.bluetea.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper memberMapper;
	// 회원 등록
	@Override
	public void register(Member member) {
//		member.setMemberPw(BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt()));
		memberMapper.insert(member);
	}
	
	// 회원 조회
	@Override
	public Member get(String id) {		
		return memberMapper.read(id);
	}
	// 로그인
	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}
	// 회원 전체 조회(관리자)
	@Override
	public List<Member> list() {
		return null;
	}
	// 회원 정보 수정
	@Override
	public int modify(Member member) {
		return memberMapper.update(member);
	}
	// 회원 삭제
	@Override
	public int remove(String id) {
		return memberMapper.remove(id);
	}
	
	// 아이디 중복 검사
	@Override
	public int idCheck(String id) {
		return memberMapper.idCheck(id);
	}
}
