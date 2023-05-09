package cloud.bluetea.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cloud.bluetea.domain.Cinema;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : CinemaService
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 영화관 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/13        김성진           파일수정
 * 
 * 
 * 
 */

public interface CinemaService {
//	int cinemaSend(Cinema vo);  // 삽입
//	
	Cinema Getcinema(String date, Long movieNum, int cinemaNum, int screenTimeNum, int theaterno); // 조회
//	
//	int cinemaRecieve(int cinemaNum, String cinemaRegion); // 수정
//	
//	int cinemaRemove(int cinemaNum);  // 삭제
	
	void register(Cinema cinema);  
	
	List<Cinema> cinemaGetRegionList(String date, Long movieNum);
	
	List<Cinema> cinemaGetList(String date, Long movieNum, int cinemaNum);
	
	Cinema get(int ctno);
}
