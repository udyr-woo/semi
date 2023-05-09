package cloud.bluetea.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : cloud.bluetea.domain
 * fileName       : Movie
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 영화
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/10        김성진           Alias 추가 
 * 2023/04/19		 우성준			  영화 포스터 변수 추가
 * 2023/04/20		 우성준			  영화 정보, 장르 변수 추가
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("movie")
public class Movie {
	private Long movieNum; // 영화에 대한 PK
	private String movieName; // 영화이름
	private Date movieOpenDate; // 개봉일
	private Date movieClosedDate; // 상영마감일(개봉일 기준 2주)
	private String movieRating; // 관람등급
	private String poster; // 해당 영화에 대한 posterfile
	private String info; // 영화 정보
	private String genre; // 영화 장르
	
	
	// 영화 포스터를 위한 URL이지만 지금 안씀
	public String getUrl() throws UnsupportedEncodingException {
		return UriComponentsBuilder.fromPath("")
				.queryParam("poster", URLEncoder.encode(poster, "utf-8"))
				.build().toUriString();
	}
}
