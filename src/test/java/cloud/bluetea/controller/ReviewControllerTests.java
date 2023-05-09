package cloud.bluetea.controller;

import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml" ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
@Log4j
public class ReviewControllerTests {
	@Autowired
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void init() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testExist() {
		log.info(context);
		log.info(mockMvc);
	}
	
	@Test
	public void testList() throws Exception {
		RequestBuilder builder = MockMvcRequestBuilders.get("/review/list").param("amount", "10").param("pageNum", "2");
		ModelMap map = mockMvc.perform(builder).andReturn().getModelAndView().getModelMap();
		List<?> list = (List<?>)map.get("list");
		list.forEach(log::info);
	}
	
//	@Test
//	public void testGet() throws Exception {
//		RequestBuilder builder = 
//				MockMvcRequestBuilders
//				.get("/review/get")
//				.param("bno", "1");
//		ModelMap map = mockMvc.perform(builder).andReturn().getModelAndView().getModelMap();
//		log.info(map);
//		log.info(map.get("boards"));
//	}
//	
//	@Test
//	public void testRegister() throws Exception {
//		RequestBuilder builder = 
//				MockMvcRequestBuilders
//				.post("/boards/register")
//				.param("ticketNum", "123456789")
//				.param("reviewBoardTitle", "컨트롤러 테스트 제목")
//				.param("reviewBoardContent", "컨트롤러 테스트 내용")
//				.param("userId", "id1");
//		String result = mockMvc.perform(builder).andReturn().getModelAndView().getViewName();
//		log.info(result);
//	}
//	
//	@Test
//	public void testModify() throws Exception {
//		RequestBuilder builder = 
//				MockMvcRequestBuilders
//				.post("/boards/modify")
//				.param("reviewBoardBno", "7")
//				.param("reviewBoardTitle", "컨트롤러 테스트 수정 제목")
//				.param("reviewBoardContent", "컨트롤러 테스트 수정 내용")
//				.param("userId", "id2");
//		String result = mockMvc.perform(builder).andReturn().getModelAndView().getViewName();
//		log.info(result);
//	}
//	
//	@Test
//	public void testRemove() throws Exception {
//		RequestBuilder builder = 
//				MockMvcRequestBuilders
//				.post("/boards/remove")
//				.param("bno", "8");
//		String result = mockMvc.perform(builder).andReturn().getModelAndView().getViewName();
//		log.info(result);
//	}
}
