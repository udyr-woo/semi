package cloud.bluetea.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.Member;
import cloud.bluetea.domain.ScreenTime;
import cloud.bluetea.domain.TicketVO;
import cloud.bluetea.service.CinemaService;
import cloud.bluetea.service.TicketService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.controller (패키지명)
 * fileName       : PaymentController (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/11 (생성일 또는 최종 수정일)
 * description    : 결제 시스템 화면과 로직 연결  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/11        우성준           파일생성
 *
 * 
 * 
 */

@Controller
@Log4j
@Data
public class PaymentController {
	private final CinemaService cinemaService;
	private final TicketService ticketService;
	
	// 테스트

	
	// 날짜, 영화, 영화관, 상영관, 상영시간
	@GetMapping("json/payment/{date}/{movieNum}/{cinemaNum}/{screenTimeNum}/{theaterno}") @ResponseBody
	public Cinema getCinema(@PathVariable String date, @PathVariable Long movieNum, @PathVariable Integer cinemaNum, @PathVariable Integer screenTimeNum, @PathVariable Integer theaterno) {
		log.info(date);
		return cinemaService.Getcinema(date, movieNum, cinemaNum, screenTimeNum, theaterno);
	}
	
	// 영화정보, seatx, seaty
	@GetMapping("json/payment/{ctno}/{seatx}/{seaty}") @ResponseBody
	public TicketVO getTicket(@PathVariable Integer ctno, @PathVariable Integer seatx, @PathVariable Integer seaty) {
		return ticketService.getTicket(ctno, seatx, seaty);
	}

	// 티켓에 대한 정보 확인
	@PostMapping("payment")
	public void payment(Model model, Long tno, @ModelAttribute("ticket") TicketVO ticket, HttpSession session)  {
		Member member = (Member) session.getAttribute("member");
		ticket.setMemberid(member.getMemberId());
		model.addAttribute("member",member);
		log.info("payment페이지에서 확인");
		log.info(ticketService.getTicket(ticket));
	}
	
	@PostMapping("payment_processing")
	public String paymentProcessing(TicketVO ticket, RedirectAttributes rttr) {
		log.info(ticket);
		ticketService.register(ticket);
		String resno = ticket.getResno();
		rttr.addAttribute("resno", resno);
		return "redirect:/confirm";
	}
	
	@GetMapping("confirm")
	public void confirm(Model model, String resno, TicketVO ticket) {
		log.info(resno);
		List<TicketVO> tickets = ticketService.getListTicketByResno(resno);
		Cinema cinema = cinemaService.get(tickets.get(0).getCtno());
		model.addAttribute("tickets", tickets);
		model.addAttribute("cinema",cinema);
	}
	
}
