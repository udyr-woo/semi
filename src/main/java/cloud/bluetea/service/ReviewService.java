package cloud.bluetea.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cloud.bluetea.domain.Review;
import cloud.bluetea.domain.Criteria;

public interface ReviewService {
	void register(Review vo);
	Review get(Long bno);
	boolean modify(Review vo);
	boolean remove(Long bno);
	List<Review> getList(Criteria cri);
	int getTotalCnt(Criteria cri);
	List<Review> getListByMovieNum(Long movieNum);
	List<Review> getListForDetail(@Param("movieNum")Long movieNum, @Param("reviewNo") Long reviewNo);
}
