package cloud.bluetea.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.TicketVO;
import cloud.bluetea.domain.TicketVO.Seat;
import cloud.bluetea.mapper.CinemaMapper;
import cloud.bluetea.mapper.TheaterMapper;
import cloud.bluetea.mapper.TicketMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : TicketServiceImpl
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 티켓 서비스 구현
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/10        김성진           파일수정
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/16        김성진           파일수정(각각 조회서비스생성)
 * 
 */
@Log4j
@ToString
@Service
@AllArgsConstructor
public class TicketServiceImpl implements TicketService{
	private TicketMapper ticketMapper;
	private CinemaMapper cinemaMapper;

	@Override
	public TicketVO getSeat(int ctno, int seatx, int seaty) {
		
		return ticketMapper.getSeat(ctno, seatx, seaty);
	}

	@Override
	public TicketVO getListTicketMember(String memberid) {
		// TODO Auto-generated method stub
		return ticketMapper.getListTicketMember(memberid);
	}

	@Override
	public TicketVO getListTicketCinema(int ctno) {
		// TODO Auto-generated method stub
		return ticketMapper.getListTicketCinema(ctno);
	}

	@Override
	public void register(TicketVO ticket) {
		for(int i=0; i<ticket.getSeats().size(); i++) {
			TicketVO vo = new TicketVO();
			vo.setSeatx(ticket.getSeats().get(i).getX());
			vo.setSeaty(ticket.getSeats().get(i).getY());
			vo.setMemberid(ticket.getMemberid());
			vo.setDate(ticket.getDate());
			vo.setCtno(ticket.getCtno());
			vo.setResno(ticket.getResno());
			ticketMapper.insertTicket(vo);
		}
		
	}

	@Override
	public TicketVO getTicket(int ctno, int seatx, int seaty) {
		// TODO Auto-generated method stub
		return ticketMapper.getTicket(ctno, seatx, seaty);
	}

	
	@Override
	public TicketVO getTicketByTno(Long tno) {
		// TODO Auto-generated method stub
		return ticketMapper.getTicketByTno(tno);
	}

	@Override
	public TicketVO getTicket(TicketVO vo) {
		Cinema cinema = cinemaMapper.get(vo.getCtno());
		vo.setCinema(cinema);
		return vo;
	}
	
	@Override
	public List<TicketVO> getListTicketByResno(String resno) {
		// TODO Auto-generated method stub
		return ticketMapper.getListTicketByResno(resno);
	}
/*	@Override
	public TicketVO ticketMemberIdGet(String memberId) {
		// TODO Auto-generated method stub
		return ticketMapper.memberIdSelectOne(memberId);
	}

	@Override
	public TicketVO ticketRegdateGet(Date regdate) {
		// TODO Auto-generated method stub
		return ticketMapper.regdateSelectOne(regdate);
	}

	@Override
	public TicketVO ticketCtnoGet(Long ctno) {
		// TODO Auto-generated method stub
		return ticketMapper.ctnoSelectOne(ctno);
	}

	@Override
	public TicketVO ticketSeatGet(int seatX, int seatY) {
		// TODO Auto-generated method stub
		return ticketMapper.seatSelectOne(seatX, seatY);
	}*/
	
	
	
	
	
}
