package cloud.bluetea.service;

import java.util.List;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.Theater;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : TheaterService
 * author         : 김성진
 * date           : 2023/04/13
 * description    : 상영관 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/13        김성진           파일생성
 * 
 * 
 */

public interface TheaterService {
	int theaterSend(Theater vo); // 삽입
	
	Theater theaterGet(int theaterno);  // 수정
	
	int theaterRecieve(int theaterno, String name); // 수정
	
	int theaterRemove(int theaterno); // 삭제
	
	List<Theater> theaterGetList();
	
}
