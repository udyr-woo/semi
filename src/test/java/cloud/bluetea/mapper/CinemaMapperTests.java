package cloud.bluetea.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.Cinema;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : CinemaMapperTests
 * author         : 김성진
 * date           : 2023/04/11
 * description    : 영화관에 대한 CRUD 테스트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        김성진           파일생성
 * 2023/04/17        김성진           테스트추가(crud 생성)
 * 2023/04/18        김성진           주석수정
 * 2023/04/21        김성진           주석수정
 * 2023/04/25        김성진           테스트추가(영화정보에 따른 조회)
 * 
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CinemaMapperTests {
	@Autowired
	private CinemaMapper cinemaMapper;
	
	// 날짜, 영화번호, 영화관에 따른 상영관 정보 조회
	@Test
	public void testGetCinemaList() {
		cinemaMapper.getCinemaList("20230417", 86876L, 1).forEach(log::info);
	}
	
	// 영화관에 대한 한개 조회
	@Test
	public void testCinemaSelectOne() {
		log.info(cinemaMapper.cinemaSelectOne(54));
	}
	
	// 영화정보에 따른 전체정보 조회
	@Test
	public void testGet() {
		log.info(cinemaMapper.get(54));
	}
	
	// 영화관 입력 테스트
	@Test
	public void testCinemaInsert() {
		Cinema cinema = new Cinema();
		cinema.setCinemaNum(9);
		cinema.setCinemaRegion("대구");
		cinemaMapper.cinemaInsert(cinema);
		log.info(cinema);
	}
	
	// 영화관 정보 변경 테스트
	@Test
	public void testCinemaUpdate() {
		Cinema cinema = cinemaMapper.cinemaSelectOne(9);
		cinemaMapper.cinemaUpdate(9, "대전");
		log.info(cinemaMapper.cinemaSelectOne(9));
	}
	
	// 영화관 삭제 테스트
	@Test
	public void testCinemaDelete() {
		cinemaMapper.cinemaDelete(9);
	}
	
}
