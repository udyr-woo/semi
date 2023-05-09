package cloud.bluetea.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cloud.bluetea.domain.Review;
import cloud.bluetea.domain.Criteria;
import cloud.bluetea.domain.PageDto;
import cloud.bluetea.service.MovieService;
import cloud.bluetea.service.ReviewService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

/**
 * packageName    : cloud.bluetea.controller (패키지명)
 * fileName       : reviewController (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/17 (생성일 또는 최종 수정일)
 * description    : 리뷰게시판  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/17        우성준           파일생성 및 CRUD구현 
 * 2023/04/20        우성준           Board에서 Review로 이름 변경, 영화리뷰 작성 및 목록 출력 비동기처리(수정, 삭제는 동기)
 * 2023/04/24        우성준           이전페이지정보 가져와서 수정이나 삭제시 그 페이지로 돌아감
 */

@Controller
@Log4j
@RequestMapping("review/*")
@Data
public class ReviewController {
	private final ReviewService reviewService;
	private final MovieService movieService;
	
	// 리뷰 목록 출력(reviewList에서)
	@GetMapping("reviewList")
	public void reviewreview(Model model, Criteria cri) {
		log.info("list()");
		cri.setOffset(cri.getAmount()*(cri.getPageNum()-1));
		log.info(cri);
		model.addAttribute("list", reviewService.getList(cri));
		model.addAttribute("page", new PageDto(reviewService.getTotalCnt(cri), cri));
	}
	
	// 리뷰 상세 정보 가져오기
	@GetMapping({"reviewList/{movieNum}","reviewList/{movieNum}/{reviewNo}"}) @ResponseBody
	public List<Review> getList(@PathVariable Long movieNum, @PathVariable(required = false) Optional<Long> reviewNo) {
		log.info(movieNum);
		log.info(reviewNo);
		return reviewService.getListForDetail(movieNum, reviewNo.orElse(0L));
	}
	
	// 비동기로 리뷰 작성
	@PostMapping("new") @ResponseBody
	public Long create(@RequestBody Review vo) {
		log.info(vo);
		reviewService.register(vo);
		return vo.getReviewNo();
	}
	
	// 비동기로 영화 상세 정보 내 리뷰목록에 추가하기 위한 리뷰 가져오기
	@GetMapping("{reviewNo}/forMovie") @ResponseBody
	public Review get(@PathVariable Long reviewNo) {
		log.info(reviewNo);
		return reviewService.get(reviewNo);
	}
	
	// 영화 상세 정보 가져오기
	@GetMapping({"getReview","modify"})
	public void get(Long reviewNo, Model model, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		log.info("get() or modify()");
		log.info(reviewNo);
		String referer = request.getHeader("referer");
		log.info(referer);
		Review review = reviewService.get(reviewNo);
		log.info(review.getMovieNum());
		model.addAttribute("review", review);
		model.addAttribute("movie", movieService.movieGet(review.getMovieNum()));
		model.addAttribute("link", referer);
	}
	
	
	// 리뷰 수정
	@PostMapping("modify")
	public String modify(Review vo, RedirectAttributes rttr, Criteria cri, String link) {		
		log.info("modify");
		log.info(vo);
		Long movieNum = vo.getMovieNum();
		reviewService.modify(vo);
		String address = "getMovie?movieNum=";
		if(link.contains(address)) {
			return "redirect:/movie/getMovie?movieNum=" + movieNum;
		}
		else {
			return "redirect:/review/reviewList" + cri.getFullQueryString();
		}
	}
	
	// 리뷰 삭제
	@PostMapping("remove")
	public String remove(Long reviewNo, RedirectAttributes rttr, Criteria cri, String link) {
		log.info("remove");
		log.info(reviewNo);
		
		Review vo = reviewService.get(reviewNo);
		Long movieNum = vo.getMovieNum();
		reviewService.remove(reviewNo);
		String address = "getMovie?movieNum=";
		if(link.contains(address)) {
			return "redirect:/movie/getMovie?movieNum=" + movieNum;
		}
		else {
			return "redirect:/review/reviewList" + cri.getFullQueryString();
		}
	}
}
