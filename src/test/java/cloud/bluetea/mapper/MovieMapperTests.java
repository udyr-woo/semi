package cloud.bluetea.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.Movie;
import cloud.bluetea.mapper.MovieMapper;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : MovieMapperTests
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 영화에 대한 CRUD 테스트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 2023/04/17        김성진           파일수정(crud 생성)
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieMapperTests {
	@Autowired
	private MovieMapper movieMapper;
	
	@Test
	public void testMovieList() {
		movieMapper.movieGetList("20230414").forEach(log::info);
	}
	
	@Test
	public void testMovieSelectOne() {
		movieMapper.movieSelectOne(2L);
	}
	
	// 안되는것 같음.
	@Test
	public void testMovieInsert() {
		Movie movie = new Movie();
		movie.setMovieNum(2L);
		movie.setMovieName("악마를 보았다");
		movie.setMovieRating("12");
		movieMapper.movieInsert(movie);
		log.info(movie);
	}
	
	@Test
	public void testMovieUpdate() {
		Movie movie = movieMapper.movieSelectOne(2L);
		movieMapper.movieUpdate(2L, "보지않았다");
		log.info(movieMapper.movieSelectOne(2L));
	}
	
	@Test
	public void testMovieDelete() {
		movieMapper.movieDelete(2L);
	}
	
}





	
