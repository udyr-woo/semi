package cloud.bluetea.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * packageName    : cloud.bluetea.domain
 * fileName       : Ticket
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 티켓
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/16        김성진           변수변경
 * 2023/04/16        김성진           변수변경
 * 2023/04/21        김성진           변수변경
 * 2023/04/24        김성진           변수변경
 * 2023/04/25        김성진           변수변경
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("ticket")
@ToString(callSuper=true)
public class TicketVO {
	private Cinema cinema;
	private Long tno; // 티켓에 대한 PK
	private String memberid; // 예매한 member
//	private Long ctno; // 예매한 해당 상영관
	private int seatx; // 예매한 해당 좌석
	private int seaty; // 예매한 해당 좌석
	
	List<Seat> seats;
	
	private String regdate; // 예매한 해당 날짜
	private List<Cinema> cinemas;
	
	private Integer ctno; // 영화관에 대한 PK
	private String date;
	private int theaterno;
	private String theaterName;
	private int cinemaNum;
	private String cinemaRegion; // 각 영화관(ex : 서울, 경기)
	private Long movieNum;
	private String movieName;

	private List<ScreenTime> screenTimes;
	
	private Date screenTimeTime; // 영화상영시간
	
	private String resno;
	
	// 좌석에 대한 클래스(변수 x,y, toString 생성)
	@Data
	public static class Seat {
		private int x;
		private int y;
		@Override
		public String toString() {
			return String.format("%c열 %s", (char)(x+65), y);
		}
		
	}
}
