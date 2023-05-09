package cloud.bluetea.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MailController {
	
//	@Autowired
//	private JavaMailSender javamailSender;
//	
//	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
//	public void sendMail() throws Exception{
//		
//		String subject = "test 메일";
//		String content = "test content";
//		String from = "test 보내는 메일";
//		String to = "test 받는 메일";
//		
//		try{
//			MimeMessage mail = javamailSender.createMimeMessage();
//			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
//			//멀티파트 메세지 사용
//			
//			// 단순 smtp인증시 사용, from은 보내는 유저이며, 반드시 있어야 함. 권한을 얻어오는 역할을 수행.
//			mailHelper.setFrom(from);
//			// 보내는 메일과 메일주소를 수신하는 유저가 알 수 있음
//			mailHelper.setFrom("testAdmin <wodnjsdl01@gmail.com>");			
//			mailHelper.setTo(to);
//			mailHelper.setSubject(subject);
//			// true는 html을 사용하겠다는 의미 <img> 태그를 사용할 수 있음.
//			// 단순한 text만 사용할 시엔 mailHelper.setText(content)를 이용.
//			mailHelper.setText(content, true);
//			
//			javamailSender.send(mail);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
//	
//	@RequestMapping(value="/sendMail", method = RequestMethod.GET)
//	public void sendMail2() throws Exception {
//		
//		String subject = "test 메일";
//		String content = "test content";
//		String from = "test 보내는 메일";
//		String to = "test 받는 메일";
//		
//		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				
//				mailHelper.setFrom(from);
//				mailHelper.setTo(to);
//				mailHelper.setSubject(subject);
//				mailHelper.setText(content, true);
//			}
//		};
//		try {
//			javamailSender.send(preparator);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
}
