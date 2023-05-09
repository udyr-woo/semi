package cloud.bluetea.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * packageName    : cloud.bluetea.domain
 * fileName       : Member
 * author         : 이재원
 * date           : 2023/04/25
 * description    : 사용자 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/05        이재원           파일생성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("member")
public class Member {
	/**
	 * memberId : ID
	 * memberPw : 비밀번호
	 * memberName : 이름
	 * memberEmail : 이메일
	 * membermemberPhoneNum : 휴대폰 번호
	 * memberNickname : 닉네임
	 * */
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private int memberPhoneNum;
	private String memberNickname;
}
