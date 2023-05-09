package cloud.bluetea.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.Movie;
import cloud.bluetea.mapper.CinemaMapper;
import cloud.bluetea.mapper.MovieMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : CinemaServiceImpl
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 영화 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/13        김성진           파일수정
 * 
 * 
 */
@Log4j
@ToString
@Service
@AllArgsConstructor
public class CinemaServiceImpl implements CinemaService{
	private CinemaMapper cinemaMapper;

//	@Override
//	public int cinemaSend(Cinema vo) {
//		// TODO Auto-generated method stub
//		return cinemaMapper.cinemaInsert(vo);
//	}
//
	@Override
	public Cinema Getcinema(String date, Long movieNum, int cinemaNum, int screenTimeNum, int theaterno) {
		// TODO Auto-generated method stub
		return cinemaMapper.getCinema(date, movieNum, cinemaNum, screenTimeNum, theaterno);
	}
//
//	@Override
//	public int cinemaRecieve(int cinemaNum, String cinemaRegion) {
//		// TODO Auto-generated method stub
//		return cinemaMapper.cinemaUpdate(cinemaNum,cinemaRegion);
//	}
//
//	@Override
//	public int cinemaRemove(int cinemaNum) {
//		// TODO Auto-generated method stub
//		return cinemaMapper.cinemaDelete(cinemaNum);
//	}
	
	

	@Override
	public List<Cinema> cinemaGetList(String date, Long movieNum, int cinemaNum) {
		// TODO Auto-generated method stub
		return cinemaMapper.getCinemaList(date, movieNum, cinemaNum);
	}

	@Override
	public List<Cinema> cinemaGetRegionList(String date, Long movieNum) {
		// TODO Auto-generated method stub
		return cinemaMapper.getRegionList(date, movieNum);
	}



	@Override
	@Transactional
	public void register(Cinema cinema) {
		cinemaMapper.insertCinema(cinema);
	}



	@Override
	public Cinema get(int ctno) {
		// TODO Auto-generated method stub
		return cinemaMapper.get(ctno);
	}

	

	
	
	
	
	
}
