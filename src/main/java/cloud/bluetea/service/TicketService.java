package cloud.bluetea.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cloud.bluetea.domain.TicketVO;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : TicketService
 * author         : 김성진
 * date           : 2023/04/10
 * description    : 티켓 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/10        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/16        김성진           파일수정(각각 조회서비스생성)
 * 
 * 
 */

public interface TicketService {
	
//	TicketVO ticketMemberIdGet(String memberId);
//
//	TicketVO ticketRegdateGet(Date regdate);
//	
//	TicketVO ticketCtnoGet(Long ctno);
//	
//	TicketVO ticketSeatGet(int seatX, int seatY);
	
	TicketVO getSeat(int ctno, int seatx, int seaty);
	
	TicketVO getTicket(TicketVO vo);
	
	TicketVO getTicket(int ctno, int seatx, int seaty);
	
	TicketVO getListTicketMember(String memberid);
	
	TicketVO getListTicketCinema(int ctno);
	
	void register(TicketVO ticket);
	
	TicketVO getTicketByTno(Long tno);
	
	List<TicketVO> getListTicketByResno(String resno);
	
	
}
