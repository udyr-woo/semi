package cloud.bluetea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cloud.bluetea.domain.Movie;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : CinemaMapper
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 영화에 대한 SQL 호출
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/17        김성진           파일수정(crud 생성)
 */

public interface MovieMapper {
	
//	@Select("select * from movie where movieNum > 0")
	List<Movie> movieGetList(String date);
	
	List<Movie> movieList();
	
	@Insert("INSERT INTO movie (movieNum, movieName, movieRating) values (#{movieNum}, #{movieName}, #{mvoieRating})")
	int movieInsert(Movie vo); // 영화 삽입
	
	@Select("select * from movie where movieNum = #{movieNum}")
	Movie movieSelectOne(Long movieNum); // 영화 조회
	
	@Update("update movie set movieName = #{movieName} where movieNum = #{movieNum}")
	int movieUpdate(@Param("movieNum") Long movieNum, @Param("movieName") String movieName); // 영화 수정
	
	@Delete("delete from movie where movieNum = #{movieNum}")
	int movieDelete(Long movieNum); // 영화 삭제
}
