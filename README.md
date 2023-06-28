# WKKL
스프링 레거시 + JSP 영화 예매 사이트
https://semi2.bluetea.cloud/


## 🖥️ 프로젝트 기획의도
WKKL은 CGV처럼 조원들의 성을 따서 만든 영화예매사이트로서 기존의 존재하는 타사 예매사이트보다 사용자들이 좀 더 소통할 수 있는 곳으로  만들고자 시작했습니다.
대부분의 영화를 보는 사람들은 CGV, 롯데시네마 혹은 메가박스에서 예매하지만, 리뷰는 씨네21, 네이버에서 합니다. 
이렇듯 분리되어있는 기능들을 하나로 합치면 사용자들이 번거로운 사이트 이동을 줄일 수 있을 것이며, 나아가 소통이 활발해지면, 모르는 사람들끼리도 영화를 같이 볼 수 있도록 채팅시스템을 적용하고자 했습니다.
<br>

## 🕰️ 개발 기간
* 4주

### 🧑‍🤝‍🧑 맴버구성
 - 팀장  : 우성준 - 예매결제, 메인페이지, 영화 소개 게시판, 후기 게시판
 - 팀원1 : 김** - 영화 선택(날짜, 시간, 상영관, 좌석까지), 영화정보 크롤링
 - 팀원2 : 이** - 로그인, 회원가입

### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **IDE** : STS 3
- **Framework** : Spring legacy
- **Database** : mariadb
- **Mapper** : Mybatis
- **SCMr** : SVN

## 📌 주요 기능
#### 회원관리
- 로그인
- 회원가입

#### 영화 예매
- 영화 선택(날짜 지정)
- 영화관 선택 및 시간 선택
- 좌석 선택
- 결제 페이지
- 예매 완료
  
#### 메인 페이지
- 메인 포스터(영화) 이미지 슬라이드(CSS)
  
#### 영화소개 및 후기
- 후기: CRUD
- 영화 소개: 포스터 및 영화정보 표시


## 📚 우성준이 작성한 파일
- Controller: HomeController, MovieController, ReviewController, PaymentController
- Domain: Criteria, PageDto, Review, Movie
- Mapper: MovieMapper, ReviewMapper
- Service: MovieService(Impl), ReviewService(Impl)
- JSP: index, payment, getReview, reviewList, getMovie, movieList, header, head, footer
- JS: review

## 📝 클론 시 필요한 jdbc.properties 설정
- db.driver=org.mariadb.jdbc.Driver
- db.url=jdbc:mariadb://localhost:{포트}/{DB이름}
- db.username={사용자 이름}
- db.password={암호}
