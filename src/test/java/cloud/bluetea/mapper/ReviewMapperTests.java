package cloud.bluetea.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cloud.bluetea.domain.Review;
import cloud.bluetea.domain.Criteria;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Test
	public void testGetList() {
		reviewMapper.getList().forEach(log::info);
	}
	
	@Test
	public void testGetListWithPaging() {
		reviewMapper.getListWithPaging(new Criteria(1, 10,"TCW", "1")).forEach(log::info);
	}
	
	@Test
	public void testGetTotalCnt() {
		log.info(reviewMapper.getTotalCnt(new Criteria(3, 10, "T", "1")));
	}
	
	@Test
	public void testInsert() {
		Review vo = new Review();
		vo.setMovieNum(86815L);
		vo.setReviewTitle("스즈메의 문단속 리뷰");
		vo.setReviewContent("너의 이름은 재밌게 봤으면 이것도 재밌을 거에요");
		vo.setMemberId("1122");
		reviewMapper.insert(vo);
	}
	@Test
	public void testInsertSelectKey() {
		Review vo = new Review();
		vo.setMovieNum(86720L);
		vo.setReviewTitle("더 퍼스트 슬램덩크 리뷰");
		vo.setReviewContent("90년대로 돌아간 기분");
		vo.setMemberId("1122");
		reviewMapper.insertSelectKey(vo);
	}
	
	@Test
	public void testRead() {
		Long bno = 44L;
		log.info(reviewMapper.read(bno));
	}
	
	@Test
	public void testDelete() {
		Long bno = 41L;
		log.info(reviewMapper.delete(bno));
	}
	
	@Test
	public void testUpdate() {
		Review vo = reviewMapper.read(1L);
		log.info(reviewMapper.read(1L));
		vo.setReviewTitle("수정된 제목");
		vo.setReviewContent("수정된 내용");
		vo.setMemberId("1122");
		reviewMapper.update(vo);
		log.info(reviewMapper.read(1L));
	}
}
