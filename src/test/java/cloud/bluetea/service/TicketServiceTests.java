package cloud.bluetea.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.TicketVO;
import cloud.bluetea.mapper.TicketMapper;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.service
 * fileName       : TicketServiceTests
 * author         : 김성진
 * date           : 2023/04/16
 * description    : 티켓서비스에 대한 테스트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/16        김성진           파일생성
 * 
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TicketServiceTests {
	@Autowired
	private TicketService ticketService;
	
//	@Test
//	public void testMemberIdGet() {
//		String memberId = "userid";
//		TicketVO vo = ticketService.ticketMemberIdGet(memberId);
//		log.info(vo);
//	}
//	
//	@Test
//	public void testRegdateGet() throws ParseException {
//		String date = "20230414";
//		Date d = new SimpleDateFormat("yyyyMMdd").parse(date);
//		TicketVO vo = ticketService.ticketRegdateGet(d);
//		log.info(vo);
//	}
//	
//	@Test
//	public void testCtnoGet() {
//		Long ctno = 1L;
//		TicketVO vo = ticketService.ticketCtnoGet(ctno);
//		log.info(vo);
//	}
//	
//	@Test
//	public void testSeatGet() {
//		int seatX = 0;
//		int seatY = 0;
//		TicketVO vo = ticketService.ticketSeatGet(seatX, seatY);
//		log.info(vo);
//	}
}
