package cloud.bluetea.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.Movie;
import cloud.bluetea.domain.Theater;
import cloud.bluetea.mapper.CinemaMapper;
import cloud.bluetea.mapper.MovieMapper;
import cloud.bluetea.mapper.TheaterMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : TheaterServiceImpl
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 상영관 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 
 * 
 */
@Log4j
@ToString
@Service
@AllArgsConstructor
public class TheaterServiceImpl implements TheaterService{
	private TheaterMapper theaterMapper;

	@Override
	public int theaterSend(Theater vo) {
		// TODO Auto-generated method stub
		return theaterMapper.theaterInsert(vo);
	}

	@Override
	public Theater theaterGet(int theaterno) {
		// TODO Auto-generated method stub
		return theaterMapper.theaterSelectOne(theaterno);
	}

	@Override
	public int theaterRecieve(int theaterno, String name) {
		// TODO Auto-generated method stub
		return theaterMapper.theaterUpdate(name, theaterno);
	}

	@Override
	public int theaterRemove(int theaterno) {
		// TODO Auto-generated method stub
		return theaterMapper.theaterDelete(theaterno);
	}

	@Override
	public List<Theater> theaterGetList() {
		// TODO Auto-generated method stub
		return theaterMapper.theaterGetList();
	}

}
