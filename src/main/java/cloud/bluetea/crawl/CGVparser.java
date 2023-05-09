package cloud.bluetea.crawl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.StandardSocketOptions;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * packageName    : cloud.bluetea.crawl
 * fileName       : CGVparser
 * author         : 김성진
 * date           : 2023/04/07
 * description    : CGV 사이트에 대한 크롤링(배우, 감독, 장르 등 수집)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/12        김성진           파일생성
 * 2023/04/18        김성진           주석수정
 * 2023/04/20        김성진           내용수정
 * 2023/04/21        김성진           주석수정
 * 
 */

public class CGVparser {
	public static void main(String[] args) throws MalformedURLException, IOException {
		// cgv 페이지에 해당 영화에 대한 값 확인
		String 슬램덩크 = "http://www.cgv.co.kr/movies/detail-view/?midx=86720";
		String 매트릭스 = "http://www.cgv.co.kr/movies/detail-view/?midx=85541";
		Document doc = Jsoup.parse(new URL(매트릭스), 2000);
		
		String info = doc.selectFirst(".sect-story-movie").text();
		String engtitle = doc.selectFirst(".sect-base-movie .title p").text();
		Element ele = doc.selectFirst("#ctl00_PlaceHolderContent_Section_Still_Cut");
		Elements els = doc.select(".sect-base-movie .spec dt");
		
		
		
		for(Element e : els) {
			// 감독 정보 크롤링
			Elements es = e.getElementsContainingText("감독").next().select("a");
			for(Element e2 : es) {
				String director = e2.text();
				String directorHref = e2.attr("href");
				String pidx = directorHref.substring(directorHref.lastIndexOf("=")+1);
				System.out.println(director);
				System.out.println(directorHref);
				System.out.println(pidx);
			}
			// 배우 정보 크롤링
			System.out.println("===================================");
			Elements es2 = e.getElementsContainingText("배우").next().select("a");
			for(Element e2 : es2) {
				String actor = e2.text();
				String actorHref = e2.attr("href");
				String pidx = actorHref.substring(actorHref.lastIndexOf("=")+1);
				System.out.println(e2.attr("href"));
				System.out.println(e2.text());
			}
			// 장르 정보 크롤링
			Elements es3 = e.getElementsContainingText("장르");
			for(Element e2 : es3) {
				String genre = e2.text();
				System.out.println(e2.text());
			}
			// 기본 정보 크롤링
			Elements es4 = e.getElementsContainingText("기본").next();
			for(Element e2 : es4) {
				String runningTime = e2.text().split(",")[1];
				String nation = e2.text().split(",")[2];
				System.out.println(e2.text());
				System.out.println(e2.text().split(",")[1]);
				System.out.println(e2.text().split(",")[2]);
			}
		}
		
		Elements lis = ele.select("img");
		for(Element e : lis) {
			System.out.println(e.attr("data-src"));

		}
	}
}
