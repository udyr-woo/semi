package cloud.bluetea.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cloud.bluetea.domain.Member;

public interface MemberService {
	//회원가입
	void register(Member member);
	
	// 로그인
	public Member login(Member member);
	
	// 회원 단일 조회
	public Member get(String id);
	
	// 회원 목록 조회
	List<Member> list();
	
	// 회원 수정
	int modify(Member member);
	
	// 탈퇴
	int remove(String id);
	
	// ID 중복 조회
	public int idCheck(String id);
}
