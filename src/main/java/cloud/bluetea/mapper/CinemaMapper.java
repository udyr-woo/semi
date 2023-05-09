package cloud.bluetea.mapper;

import java.util.List;

import javax.annotation.ParametersAreNonnullByDefault;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.Movie;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : CinemaMapper
 * author         : 김성진
 * date           : 2023/04/11
 * description    : 영화관에 대한 SQL 호출
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/13        김성진           파일수정(주석 수정)
 * 2023/04/17        김성진           파일수정(crud 생성)
 * 
 */

public interface CinemaMapper {
	
	// 날짜, 영화번호, 영화관 번호에 따른 정보 조회
	List<Cinema> getCinemaList(@Param("date") String date, @Param("movieNum") Long movieNum, @Param("cinemaNum") int cinemaNum);
	List<Cinema> getRegionList(@Param("date") String date, @Param("movieNum") Long movieNum);
	
	Cinema getCinema(@Param("date") String date, @Param("movieNum") Long movieNum, @Param("cinemaNum") int cinemaNum, @Param("screenTimeNum") int screenTimeNum, @Param("theaterno") int theaterno);
	
	// 영화정보 삽입
	void insertCinema(Cinema cinema); 
	
	// 영화정보번호에 따른 영화정보전체 조회
	Cinema get(int ctno); 
	
	// 영화관에 대한 삽입
	@Insert("INSERT INTO cinema (cinemaNum, cinemaRegion) values (#{cinemaNum}, #{cinemaRegion})")
	int cinemaInsert(Cinema vo); 
	
	// 영화관 한개에 대한 조회
	@Select("select * from cinema where cinemaNum = #{cinemaNum}")
	Cinema cinemaSelectOne(int cinemaNum);
	
	// 영화관 수정
	@Update("update cinema set cinemaRegion = #{cinemaRegion} where cinemaNum = #{cinemaNum}")
	int cinemaUpdate(@Param("cinemaNum") int cinemaNum, @Param("cinemaRegion") String cinemaRegion);
	
	
	// 영화관 삭제
	@Delete("delete from cinema where cinemaNum = #{cinemaNum}")
	int cinemaDelete(int cinemaNum);

}
