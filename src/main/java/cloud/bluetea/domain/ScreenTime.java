package cloud.bluetea.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : cloud.bluetea.domain
 * fileName       : ScreenTime
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 영화
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/12        김성진           파일생성
 * 2023/04/18        김성진           주석수정
 * 2023/04/20        김성진           변수추가
 * 2023/04/21        김성진           주석수정
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("screentime")
public class ScreenTime {
	private int screenTimeNum; // 영화상영시간에 대한 PK
	private Date screenTimeTime; // 영화상영시간
	private int remain; // 남은좌석(총 184석)
}
