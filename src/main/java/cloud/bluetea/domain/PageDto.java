package cloud.bluetea.domain;

import lombok.Data;

/**
 * packageName    : cloud.bluetea.domain (패키지명)
 * fileName       : Criteria (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/10 (생성일 또는 최종 수정일)
 * description    : 리뷰게시판 페이징 처리를 위한 DTO  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        우성준           파일생성
 */
@Data
public class PageDto {
	
	// 하단에 출력될 페이지 사이즈
	private int pageCount = 10;
	// 시작 페이지 숫자
	private int startPage;
	// 종료 페이지 숫자
	private int endPage;
	// 게시글 총갯수
	private int total;
	// next, prev
	private boolean prev;
	private boolean next;
	
	private boolean doublePrev;
	private boolean doubleNext;
	
	// Criteria
	private Criteria cri;
	
	public PageDto(int total, Criteria cri) {
		this(10, total, cri);
	}
	
	public PageDto(int pageCount, int total, Criteria cri) {
		this.pageCount = pageCount;
		this.total = total;
		this.cri = cri;
//		cri.getAmount()
//		cri.getPageNum()
//		total
		
		endPage = (cri.getPageNum() + (pageCount-1)) / pageCount * pageCount;
		startPage = endPage - (pageCount - 1);
		int realEnd = (total + (cri.getAmount()-1)) / cri.getAmount();
		if(endPage > realEnd) {
			endPage = realEnd;
		}
		prev = cri.getPageNum() > 1;
		next = cri.getPageNum() < realEnd;
		
		doublePrev = startPage > 1;
		doubleNext = endPage < realEnd;
	}



	
	
	// 예정 <<, >>
	
}