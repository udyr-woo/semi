package cloud.bluetea.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.Criteria;
import cloud.bluetea.domain.Review;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTests {
	@Autowired
	private ReviewService reviewService;
	
	@Test
	public void Exist() {
		assertNotNull(reviewService);
		log.info(reviewService);
	}
	
	@Test
	public void testRegister() {
		Date now = new Date();
		Review vo = new Review();
		vo.setMovieNum(1L);
		vo.setReviewTitle("던드 리뷰");
		vo.setReviewContent("킬링타임용 영화 그 이상 그 이하도 아님");
		vo.setReviewRegdate(now);
		vo.setReviewUpdatedate(now);
		vo.setMemberId("id2");
		
		log.info(vo);
		reviewService.register(vo);
		log.info(vo);
	}
	
	@Test
	public void testGet() {
		Long bno = 48L;
		Review vo = reviewService.get(bno);
		log.info(vo);
	}
	
	@Test
	public void testGetList() {
		reviewService.getList(new Criteria()).forEach(log::info);
	}
	
	@Test
	public void testRemove() {
		Long bno = 47L;
		Review vo = reviewService.get(bno);
		log.info(vo);
		assertTrue(reviewService.remove(bno));
		vo = reviewService.get(bno);
		assertNull(vo);
	}
	
	@Test
	public void testUpdate() {
		Date now = new Date();
		Long bno = 2L;
		Review vo = reviewService.get(bno);
		log.info(vo);
		vo.setReviewContent("변경된 내용2");
		vo.setReviewUpdatedate(now);
		reviewService.modify(vo);
		log.info(vo);
	}
}
