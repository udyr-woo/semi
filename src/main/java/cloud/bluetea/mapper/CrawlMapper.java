package cloud.bluetea.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : CrawlMapper
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 크롤링에 대한 SQL 호출
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 
 * 
 */

public interface CrawlMapper {
	@Insert("insert into movie values (#{movienum}, #{moviename}, #{movieopendate}, #{moviecloseddate}, #{movierating}, #{posteruuid})")
	void insert(Map<String, Object> map); // 영화에 대한 정보 삽입
	
	@Select("select * from t_cgv")
	List<Map<String, Object>> getList(); // 영화 목록 조회
	
	@Select("select * from t_cgv where pidx = #{pidx}")
	Map<String, Object> select(String idx); // 영화 한개 조회
	
	@Insert("insert into t_person(pidx, name, href) values(#{pidx}, #{name}, #{href}) ON DUPLICATE KEY UPDATE name = name")
	void insertPerson(Map<String, String> map); // 
	
	@Insert("insert into t_actor(pidx, midx) values(#{pidx}, #{midx})")
	void insertActor(Map<String, String> map); // 영화 배우 삽입
	
	@Insert("insert into t_director(pidx, midx) values(#{pidx}, #{midx})")
	void insertDirector(Map<String, String> map); // 영화감독 삽입
	
	@Insert("insert into cgv_attach(odr, midx) values(#{odr}, #{midx})")
	void insertAttach(Map<String, String> map); // 포스터파일 삽입
	
	@Update("update t_cgv set info = #{info}, engtitle = #{engtitle}, genre=#{genre}, runningtime = #{runningtime}, nation = #{nation} where midx = #{midx}")
	void updateCGV(Map<String, String> m2); // 영화수정(영어제목, 장르, 러닝타임, 국가) 
}
