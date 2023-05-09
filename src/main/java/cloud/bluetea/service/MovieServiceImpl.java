package cloud.bluetea.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cloud.bluetea.domain.Movie;
import cloud.bluetea.mapper.MovieMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : MovieServiceImpl
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
@Log4j
@ToString
@Service
@AllArgsConstructor
public class MovieServiceImpl implements MovieService{
	private MovieMapper movieMapper;

	@Override
	public int movieSend(Movie vo) {
		// TODO Auto-generated method stub
		return movieMapper.movieInsert(vo);
	}

	@Override
	public Movie movieGet(Long movieNum) {
		// TODO Auto-generated method stub
		return movieMapper.movieSelectOne(movieNum);
	}

	@Override
	public int movieRecieve(Long movieNum, String movieName) {
		// TODO Auto-generated method stub
		return movieMapper.movieUpdate(movieNum, movieName);
	}

	@Override
	public int movieRemove(Long movieNum) {
		// TODO Auto-generated method stub
		return movieMapper.movieDelete(movieNum);
	}

	@Override
	public List<Movie> movieGetList(String date) {
		// TODO Auto-generated method stub
		return movieMapper.movieGetList(date);
	}
	
	public List<Movie> movieList() {
		return movieMapper.movieList();
	}
	
}
