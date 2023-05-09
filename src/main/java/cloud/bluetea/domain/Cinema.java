package cloud.bluetea.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : cloud.bluetea.domain
 * fileName       : Cinema
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 영화관
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/12        김성진           내용수정
 * 2023/04/18        김성진           주석수정
 * 2023/04/20        김성진           내용수정
 * 2023/04/21        김성진           주석수정
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("cinema")
public class Cinema {
	
	private Integer ctno; // 영화정보번호(PK)
	private String date; // 상영날짜
	private int theaterno;  // 상영관번호
	private String theaterName; // 상영관이름(ex : 1관, 2관)
	private int cinemaNum; // 영화관번호
	private String cinemaRegion; // 영화관이름(ex : 서울, 경기)
	private Long movieNum; // 영화번호
	private String movieName; // 영화이름
//	private int remain;
	private List<ScreenTime> screenTimes; // 상영시간 리스트
	
	
	private ScreenTime screenTime; // 상영시간 테이블
	private int screenTimeNum; // 영화상영시간에 대한 PK
	private Date screenTimeTime; // 영화상영시간
	private int remain; // 남은 좌석
	
}
