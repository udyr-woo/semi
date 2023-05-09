package cloud.bluetea.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cloud.bluetea.domain.Member;

public interface MemberMapper {
	
	// 회원 등록
	void insert(Member vo);
	
	// 회원 단일 조회
	public Member read(String id);
	
	// 회원 전체 조회
	List<Member> getList();
	
	// 회원 수정
	int update(Member vo);
	
	// 회원 탈퇴
	int remove(String id);
	
	// 로그인
	public Member login(Member member);
	
	// 아이디 중복 검사
	public int idCheck(String id);
}
