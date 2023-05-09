package cloud.bluetea.controller;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
/**
 * packageName    : cloud.bluetea.controller
 * fileName       : MailTestcontroller
 * author         : 이재원
 * date           : 2023/04/09
 * description    : 이메일 서비스 Test 목적
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/09        이재원           파일생성
 * 2023/04/10        이재원           Email 송, 수신 Test 완료
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MailTestController {

	@Autowired
	JavaMailSenderImpl mailSender;
	
	@Test
	public void mailSendTest() {
		String subject = "test 메일입니다 제발좀 갔으면 좋겠다";
		String content = "메일 테스트 내용 제발가라";
		String from = "nhy3533@naver.com";
		String to = "wodnjsdl0101@gmail.com";
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content);

			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
