

import javax.servlet.annotation.WebServlet;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/") 
public class Controller extends DispatcherServlet {
	/* 	 
		현재 컨트롤러가 WEB-INF/Controller-servlet.xml과 연동돼 있다.
		우리가 사용할 프론트 컨트롤러로, @requestMaping을  /로 설정해 놓았습니다.
		즉, 해당 메서드에서 @RequestMapping("이름") 이렇게 사용하면 됩니다. 
	*/
	
	
}
