package project.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

/**
 * Application Lifecycle Listener implementation class Mylistener
 *
 */
@WebListener
public class Mylistener extends ContextLoaderListener implements ServletContextListener {
	
}
