package cloud.bluetea.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cloud.bluetea.domain.Review;
import cloud.bluetea.domain.Criteria;
import cloud.bluetea.mapper.ReviewMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
@ToString
public class ReviewServiceImpl implements ReviewService {
//	private ReplyMapper replyMapper;
	private final ReviewMapper reviewMapper;

	@Override
	public void register(Review vo) {
		reviewMapper.insertSelectKey(vo);

	}

	@Override
	public Review get(Long bno) {
		return reviewMapper.read(bno);
	}

	@Override
	public List<Review> getListByMovieNum(Long MovieNum) {
		return reviewMapper.getListByMovieNum(MovieNum);
	}

	@Override
	public boolean modify(Review vo) {
		return reviewMapper.update(vo) > 0;
	}

	@Override
	@Transactional
	public boolean remove(Long bno) {
//		replyMapper.deleteByBno(bno);
		return reviewMapper.delete(bno) > 0;
	}

	@Override
	public List<Review> getList(Criteria cri) {
		return reviewMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		return reviewMapper.getTotalCnt(cri);
	}

	@Override
	public List<Review> getListForDetail(Long movieNum, Long reviewNo) {
		// TODO Auto-generated method stub
		return reviewMapper.getListForDetail(movieNum, reviewNo);
	}
}
