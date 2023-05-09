package cloud.bluetea.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : ScreenTimeMapperTests
 * author         : 김성진
 * date           : 2023/04/11
 * description    : 영화상영시간에 대한 CRUD 테스트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        김성진           파일생성
 * 2023/04/25		 김성진			  테스트내용추가
 * 
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ScreenTimeMapperTests {
	@Autowired
	private ScreenTimeMapper screenTimeMapper;
	
	// 영화상영시간 1개 조회
	@Test
	public void testScreenTimeSelectOne() {
		log.info(screenTimeMapper.screenTimeSelectOne(1L));
	}

	// 영화상영시간 삽입
	@Test
	public void testScreenTimeInsert() {
		log.info(screenTimeMapper.screenTimeInsert(20, new Date()));
	}
	
	// 영화상영시간 수정
	@Test
	public void testScreenTimeUpdate() {
		log.info(screenTimeMapper.screenTimeUpdate(20, new Date()));
	}
	
	// 영화상영시간 삭제
	@Test
	public void testScreenTimeDelete() {
		log.info(screenTimeMapper.screenTimeDelete(20));
	}
}
