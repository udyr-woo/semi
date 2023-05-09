package cloud.bluetea.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : cloud.bluetea.domain (패키지명)
 * fileName       : Criteria (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/17 (생성일 또는 최종 수정일)
 * description    : 리뷰게시판 검색 및 페이징 처리를 위한 VO  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/17        우성준           파일생성
 * 
 * 
 */

@Data
@NoArgsConstructor
public class Criteria {
	
		// 현재 페이지
		private int pageNum = 1; 
		
		// 출력할 리뷰의 양
		private int amount = 10; 
		
		// 제목, 내용, 글쓴이
		private String type; 
		
		// 입력받을 검색어
		private String keyword; 
		
		// 페이징 처리를 위한 변수 ex)0~9, 10~19, 20~29...
		private int limit = pageNum * amount;
		private int offset = (pageNum-1) * amount;
		
		public Criteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}

		public Criteria(int pageNum, int amount, String type, String keyword) {
			this.limit = pageNum * amount;
			this.offset = (pageNum-1) * amount;
			this.type = type;
			this.keyword = keyword;
		}
		
		public Criteria(int pageNum, int amount, String type, String keyword, int limit, int offset) {
			this.limit = pageNum * amount;
			this.offset = (pageNum-1) * amount;
			this.type = type;
			this.keyword = keyword;
			this.pageNum = pageNum;
			this.amount = amount;
		}
		public Criteria(int pageNum, int amount, int limit, int offset) {
			this.limit = pageNum * amount;
			this.offset = (pageNum-1) * amount;
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		public String getQueryString () {
			return UriComponentsBuilder.fromPath("")
					//.queryParam("pageNum", pageNum)
					.queryParam("amount", amount)
					.queryParam("type", type)
					.queryParam("keyword", keyword)
					.build()
					.toUriString();
		}
		
		// 쿼리스트링을 넘겨주기 위한 메소드
		public String getFullQueryString () {
			return UriComponentsBuilder.fromPath("")
					.queryParam("pageNum", pageNum)
					.queryParam("amount", amount)
					.queryParam("type", type)
					.queryParam("keyword", keyword)
					.build()
					.toUriString();
		}
		
		public String[] getTypeArr() {
			return type == null ? new String[]{} : type.split(""); //null 체크
		}

	}