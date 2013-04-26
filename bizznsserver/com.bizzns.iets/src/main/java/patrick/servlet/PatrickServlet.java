package patrick.servlet;


import java.io.PrintWriter;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.osgi.service.component.ComponentContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component(metatype = false, immediate = true)
@Service(value = javax.servlet.Servlet.class)
@Properties({
    @Property(name = "sling.servlet.resourceTypes", value = "/apps/this/is/a/testresourcetype"),
    @Property(name = "sling.description", value = "Patrick Servlet"),
    @Property(name = "sling.vendor", value = "Bizzns CMS"),
})
public class PatrickServlet extends SlingAllMethodsServlet {

    private static final Logger log = LoggerFactory.getLogger(PatrickServlet.class);

    protected void activate(ComponentContext ctx) { 
        log.info("bizzns :: patrick servlet :: activate called");
    }

    protected void deactivate(ComponentContext ctx) {
    	 log.info("bizzns :: patrick servlet :: deactivate called");
    }

    @Override
    protected void doGet(SlingHttpServletRequest req,
            SlingHttpServletResponse resp) {
    	try {
	    	PrintWriter out = resp.getWriter();
	    	out.println("Hello Sling world");
	    	System.out.println("hallooooo");
	    	log.info("blaaaaaa");
    	} catch(Throwable throwable) {
    	}
    }
}
