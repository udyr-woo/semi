package cloud.bluetea.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cloud.bluetea.domain.TicketVO;

/**
 * packageName    : cloud.bluetea.mapper
 * fileName       : TicketMapper
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 티켓에 대한 SQL 호출
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/11        김성진           파일수정
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/16        김성진           파일수정(Mapper생성)
 * 2023/04/17        김성진           파일수정(crud 생성)
 * 
 */

public interface TicketMapper {
	
	// user가 예약한 것 조회
	@Select("select * from ticket2 where memberid = #{memberid}")
	TicketVO memberIdSelectOne(String memberId);
	
	// 예약한 날짜 조회
	@Select("select * from ticket2 where regdate = #{regdate}")
	TicketVO regdateSelectOne(Date regdate);
	
	// 영화 조회
	@Select("select * from ticket2 where ctno = #{ctno}")
	TicketVO ctnoSelectOne(Long ctno);
	
	// 영화 좌석 조회
	@Select("select * from ticket2 where seatx = #{seatx} and seaty = #{seaty}")
	TicketVO seatSelectOne(@Param("seatx") int seatx, @Param("seaty") int seaty);
	
	TicketVO getSeat(@Param("ctno") int ctno, @Param("seatx") int seatx, @Param("seaty") int seaty);

	TicketVO getTicket(@Param("ctno") int ctno, @Param("seatx") int seatx, @Param("seaty") int seaty);
	
	TicketVO getListTicketMember(@Param("memberid") String memberid);
	
	TicketVO getListTicketCinema(@Param("ctno") int ctno);
	
	void insertTicket(TicketVO ticket);
	
	TicketVO getTicketByTno(Long tno);
	
	List<TicketVO> getTicketByRegdate(String regdate);
	
	List<TicketVO> getListTicketByResno(String resno);
}
