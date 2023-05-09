package cloud.bluetea.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
/**
 * SMS api
 * https://coolsms.co.kr/ * 
 *  */	
@Service
@AllArgsConstructor
public class MessageService {

	public void sendMessage(HttpServletRequest request, String randomNum) {
		// 발급받은 인증키(api, secret)
		String api_key = "NCSZAXPTGQAEIQ9S"; // 멤버 id : MEMWqrO11T37KE
		String api_secret = "4QZ1MU33NZ1SJQOHH1WPMPXCLUA6DSUZ";

		Message coolsms = new Message(api_key, api_secret); // 권한을 받기위한 키값 저장.
//		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		String mTel = request.getParameter("mTel"); // 수신전화번호

		params.put("to", mTel); // 직접 입력 가능, String 형태
		System.out.println(mTel);
		params.put("from", "01083362503");
		params.put("text", "Semi Project 본인 확인 인증번호" + randomNum + "를 입력해 주세요");
		params.put("type", "SMS"); // 문자 타입
		System.out.println(params);
		params.put("app_version", "JAVA SDK v2.2");
		try {
			coolsms.send(params);
			System.out.println(params);
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	public static void main(String[] args) {
		MessageService service = new MessageService();
		System.out.println();
	}
}
