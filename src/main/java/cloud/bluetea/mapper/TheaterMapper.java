package cloud.bluetea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cloud.bluetea.domain.Theater;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : TheaterMapper
 * author         : 김성진
 * date           : 2023/04/11
 * description    : 상영관에 대한 SQL 호출
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/17        김성진           파일수정(crud 생성)
 * 2023/04/18        김성진           상영관리스트 조회 추가
 * 
 */

public interface TheaterMapper {
	// CRUD
	// 상영관에 대한 삽입
	@Insert("INSERT INTO theater_info (theaterno, name) values (#{theaterno}, #{name})")
	int theaterInsert(Theater vo); 
	
	// 상영관에 대한 조회
	@Select("select * from theater_info where theaterno = #{theaterno}")
	Theater theaterSelectOne(int theaterno); 
	
	// 상영관에 대한 수정
	@Update("update theater_info set name = #{name} where theaterno = #{theaterno}")
	int theaterUpdate(@Param("name") String name, @Param("theaterno") int theaterno); 
	
	// 상영관에 대한 삭제
	@Delete("delete from theater_info where theaterno = #{theaterno}")
	int theaterDelete(int theaterno); 
	
	// 상영관 리스트 조회
	@Select("select * from theater_info where theaterno > 0")
	List<Theater> theaterGetList();

}
