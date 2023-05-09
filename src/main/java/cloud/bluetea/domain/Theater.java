package cloud.bluetea.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : cloud.bluetea.domain
 * fileName       : Theater
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 상영관
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/12        김성진           파일수정(문서주석삽입)
 * 2023/04/13        김성진           파일수정(alias 추가)
 * 2023/04/21        김성진           주석수정
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("theater")
public class Theater {
	private int theaterno; // 상영관에 대한 PK
	private String name; // 상영관(ex : 1관, 2관, IMAX)

}
