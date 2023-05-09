package cloud.bluetea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cloud.bluetea.domain.Review;
import cloud.bluetea.domain.Criteria;


public interface ReviewMapper {
	List<Review> getList();
	
	List<Review> getListByMovieNum(Long MovieNum);
	
	List<Review> getListWithPaging(Criteria cri);

	int getTotalCnt(Criteria cri);
	
	void insert(Review vo);
	
	void insertSelectKey(Review vo);
	
	Review read(Long bno);
	
	int delete(Long bno);
	
	int update(Review vo);
	
	List<Review> getListForDetail(@Param("movieNum")Long movieNum, @Param("reviewNo") Long reviewNo);
	
//	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
