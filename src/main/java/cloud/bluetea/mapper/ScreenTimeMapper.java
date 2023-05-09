package cloud.bluetea.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cloud.bluetea.domain.ScreenTime;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : ScreenTimeMapper
 * author         : 김성진
 * date           : 2023/04/11
 * description    : 영화상영시간에 대한 SQL 호출
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 
 */

public interface ScreenTimeMapper {
	
	// 영화상영시간 삽입
	@Insert("INSERT INTO screentime (screenTimeNum, screenTimeTime) values (#{screenTimeNum}, #{screenTimeTime}")
	int screenTimeInsert(@Param("screenTimeNum") int screenTimeNum, @Param("screenTimeTime") Date screenTimeTime);
	
	// 영화상영시간 조회
	@Select("select * from screentime where screenTimeNum = #{screenTimeNum}")
	ScreenTime screenTimeSelectOne(Long screenTimeNum); 
	
	// 영화상영시간 수정
	@Update("update screentime set screenTimeTime = #{screenTimeTime} where screenTimeNum = #{screenTimeNum}")
	int screenTimeUpdate(@Param("screenTimeNum") int screenTimeNum, @Param("screenTimeTime") Date screenTimeTime); 
	
	// 영화상영시간 삭제
	@Delete("delete from screentime where screenTimeNum = #{screenTimeNum}")
	int screenTimeDelete(int screenTimeNum); 
}
