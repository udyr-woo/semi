package cloud.bluetea.service;

import java.util.List;

import cloud.bluetea.domain.Movie;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : MovieService
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 영화 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 
 * 
 */

public interface MovieService {
	int movieSend(Movie vo);  // 삽입
	
	Movie movieGet(Long movieNum); // 조회
	
	int movieRecieve(Long movieNum, String movieName); // 수정
	
	int movieRemove(Long movieNum); // 삭제
	
	List<Movie> movieGetList(String date);
	
	List<Movie> movieList();
}
