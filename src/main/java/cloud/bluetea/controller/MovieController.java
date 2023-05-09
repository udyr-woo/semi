package cloud.bluetea.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cloud.bluetea.domain.Member;
import cloud.bluetea.domain.Review;
import cloud.bluetea.service.MovieService;
import cloud.bluetea.service.ReviewService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.controller (패키지명)
 * fileName       : MovieController (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/17 (생성일 또는 최종 수정일)
 * description    : 영화소개게시판  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/17        우성준           파일생성
 * 2023/04/19		 우성준			  영화 포스터 출력(movieList)
 * 2023/04/20		 우성준			  영화정보 출력(getMovie), Gallery를 Movie로 이름 변경
 */

@Controller
@Log4j
@Data
@RequestMapping("movie/*")
public class MovieController {
	
	private final MovieService movieService;
	private final ReviewService reviewService;
	
	// 영화 목록 불러오기
	@GetMapping("movieList")
	public void movieList(Model model) {
		model.addAttribute("movies", movieService.movieList());
	}
	
	// 영화 상세 정보 가져오기(해당 리뷰까지)
	@GetMapping("getMovie/{movieNum}")
	public String getMovieByPath(@PathVariable Long movieNum, Model model, HttpSession session, Member member) {
		member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);
		model.addAttribute("movie",movieService.movieGet(movieNum));
		model.addAttribute("reviews", reviewService.getListByMovieNum(movieNum));
		return "movie/getMovie";
	}
	
	// 영화 상세 정보 가져오기
	@GetMapping({"getMovie"})
	public void getMovie(Long movieNum, Model model) {
		log.info("get()");
		log.info(movieNum);
		model.addAttribute("movie",movieService.movieGet(movieNum));
	}
	
	// 영화리뷰 작성 (동기)
//	@PostMapping("{movieNum}")
//	public String register(Review vo, RedirectAttributes rttr, @PathVariable Long movieNum, HttpSession session, Member member) {
//		log.info("register");
//		log.info(vo);
//		member = (Member) session.getAttribute("member");
//		vo.setMemberId(member.getMemberId());
//		vo.setMovieNum(movieNum);
//		reviewService.register(vo);
//		rttr.addFlashAttribute("result", vo.getReviewNo());
//		return "redirect:/movie/" + movieNum;
//	}
}
