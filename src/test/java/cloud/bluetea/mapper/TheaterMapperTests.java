package cloud.bluetea.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.Theater;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       :	TheaterMapperTests
 * author         : 김성진
 * date           : 2023/04/11
 * description    : 상영관에 대한 CRUD 테스트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        김성진           파일생성
 * 2023/04/17        김성진           파일수정(crud 생성)
 * 2023/04/21        김성진           상영관정보조회
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TheaterMapperTests {
	@Autowired
	private TheaterMapper theaterMapper;
	
	// 상영관 1개 조회
	@Test
	public void testTheaterSelectOne() {
		log.info(theaterMapper.theaterSelectOne(1));
	}
	
	// 상영관 추가
	@Test
	public void testTheaterInsert() {
		Theater theater = new Theater();
		theater.setTheaterno(561);
		theater.setName("5관");
		theaterMapper.theaterInsert(theater);
		log.info(theater);
	}
	
	// 상영관 수정
	@Test
	public void testTheaterUpdate() {
		log.info(theaterMapper.theaterUpdate("1관", 561));
	}
	
	// 상영관 삭제
	@Test
	public void testTheaterDelete() {
		log.info(theaterMapper.theaterDelete(561));
	}
	
	// 상영관 리스트 조회
	@Test
	public void testTheaterGetList() {
		log.info(theaterMapper.theaterGetList());
	}
}
