package cloud.bluetea.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cloud.bluetea.service.MovieService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.controller (패키지명)
 * fileName       : HomeController (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/03 (생성일 또는 최종 수정일)
 * description    : 홈게시판  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/03        우성준           파일생성
 * 2023/04/21        우성준           영화목록에서 상위 4개 출력
 * 
 * 
 */
@Controller
@Log4j
@Data
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private final MovieService movieService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		model.addAttribute("movies", movieService.movieList());

		return "index";		
		
	}	
	@GetMapping("error404")
	public void Error404() {
		
	}
}
