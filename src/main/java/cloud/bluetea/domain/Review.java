package cloud.bluetea.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : cloud.bluetea.domain (패키지명)
 * fileName       : Review (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/17 (생성일 또는 최종 수정일)
 * description    : 리뷰VO  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/17        우성준           파일생성
 * 
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("review")
public class Review {
	
	// 리뷰고유번호(PK)
	private Long reviewNo;
	
	// 영화고유번호(FK)
	private Long movieNum;
	
	// 리뷰제목
	private String reviewTitle;
	
	// 리뷰내용
	private String reviewContent;
	
	// 리뷰한 사용자의 아이디(FK)
	private String memberId;
	
	// 리뷰 작성한 날짜
	private Date reviewRegdate;
	
	// 리뷰 수정한 날짜
	private Date reviewUpdatedate;
	
	// 사용자의 영화 추천 여부
	private int movieRecommend;
}
