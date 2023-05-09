package cloud.bluetea.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cloud.bluetea.domain.Cinema;
import cloud.bluetea.domain.Movie;
import cloud.bluetea.domain.TicketVO;
import cloud.bluetea.service.CinemaService;
import cloud.bluetea.service.MovieService;
import cloud.bluetea.service.TheaterService;
import cloud.bluetea.service.TicketService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.controller
 * fileName       : TicketController
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 예매시스템
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/09        김성진           Getmapping 추가
 * 2023/04/13        김성진           Getmapping 추가
 * 2023/04/16        김성진           Getmapping 내용수정
 * 2023/04/18        김성진           Getmapping 내용수정(날짜선택)
 * 2023/04/20        김성진           Getmapping 내용수정(영화선택 등)
 * 2023/04/21        김성진           movieBooking.jsp 데이터 값 연동 확인
 * 2023/04/24        김성진           seatBooking.jsp 연동
 * 2023/04/25        김성진           seatBooking.jsp 관련 내용 수정
 * 
 */

@Controller
@Log4j
@Data
public class TicketController {
	private final MovieService movieService;
	private final CinemaService cinemaService;
	private final TheaterService theaterService;
	private final TicketService ticketService;
	
	@GetMapping({"movieBooking", "movieBooking/d/{date}", "movieBooking/{movieNum}/{date}", "movieBooking/m/{movieNum}"})
	public String ticket(Model model, 
			@PathVariable(required=false) Optional<String> date, 
			@ModelAttribute @PathVariable(required=false) Long movieNum) {
		log.info("ticket 출력 예제");
		
		log.info(movieNum);
		String d = date.orElse(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		log.info(d);
		model.addAttribute("date", d);
		
		model.addAttribute("movies",movieService.movieGetList("20230419"));
		model.addAttribute("cinemas",cinemaService.cinemaGetRegionList("20230419", 86876L));
		model.addAttribute("theaters",theaterService.theaterGetList());
		return "movieBooking";
	}
	
	// 날짜 선택
	@GetMapping("json/movie/{date}") @ResponseBody
	public List<Movie> getMovies(@PathVariable String date) {
		log.info(date);
		return movieService.movieGetList(date);
	}
	
	// 날짜 선택 후 영화 선택
	@GetMapping("json/movie/{date}/{movieNum}") @ResponseBody
	public List<Cinema> getCinemaRegion(@PathVariable String date, @PathVariable Long movieNum) {
		log.info(date);
		return cinemaService.cinemaGetRegionList(date, movieNum);
	}
	
	// 날짜 선택, 영화 선택 후 영화관 선택
	@GetMapping("json/movie/{date}/{movieNum}/{cinemaNum}") @ResponseBody
	public List<Cinema> getCinema(@PathVariable String date, @PathVariable Long movieNum, @PathVariable int cinemaNum) {
		log.info(date);
		// 상영관 및 시간이 나오게
		
		return cinemaService.cinemaGetList(date, movieNum, cinemaNum);
	}
	
	// 날짜 선택, 영화 선택, 영화관 선택 후 상영관 및 시간 선택
	@GetMapping("json/seat/{date}/{movieNum}/{cinemaNum}/{screenTimeNum}/{theaterno}") @ResponseBody
	public Cinema getCinema(@PathVariable String date, @PathVariable Long movieNum, @PathVariable int cinemaNum, @PathVariable int screenTimeNum, @PathVariable int theaterno) {
		log.info(date);	
		return cinemaService.Getcinema(date, movieNum, cinemaNum, screenTimeNum, theaterno);
	}
	
	// 
	@GetMapping("seatBooking")
	public void seatBooking(Model model, String date, Long movieNum, int cinemaNum, int screenTimeNum, int theaterno) {
		log.info("seatBooking페이지에서 확인");
		model.addAttribute("cinema", cinemaService.Getcinema(date, movieNum, cinemaNum, screenTimeNum, theaterno));
		model.addAttribute("date", date);
	}
	
	// movieBooking의 정보를 seatBooking으로 redirect
	@PostMapping("movieBooking")
	public String moiveBooking(Cinema cinema, String date, Long movieNum, int cinemaNum, int screenTimeNum, int theaterno) {
		cinema.setDate(date);
		cinema.setMovieNum(movieNum);
		cinema.setCinemaNum(cinemaNum);
		cinema.setTheaterno(theaterno);
		cinema.setScreenTimeNum(screenTimeNum);
		return "redirect:/seatBooking";
	}

}
