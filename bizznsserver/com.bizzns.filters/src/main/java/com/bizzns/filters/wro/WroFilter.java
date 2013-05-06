package com.bizzns.filters.wro;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.felix.scr.annotations.sling.SlingFilter;
import org.apache.sling.engine.EngineConstants;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

 
 
@Component (metatype = true, immediate=true )
@Service 
@Properties ( { 
    			@Property (name="pattern", label="Filter Pattern", description="URL pattern to filter", value="/wro/*"), 
                @Property (name = "sling.filter.scope", label="sling.filter.scope", value = "request"), 
                @Property (name = "service.ranking", label="service.ranking" ,description="Service Ranking", intValue = 1000)
              })

 

public final class WroFilter implements Filter {
	
	/**
	* Enable/Disable The Filter
	*/
	@Property(name="enabled", label="Enable Filter",
	description="Enables or Disables the WRO (web resource optimizer) Filter",
	boolValue = true)
	private Boolean enabled;
	
    private static final Logger log = LoggerFactory.getLogger(WroFilter.class);

	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException { 

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
        log.info("inside filter - init function");
	}

}
