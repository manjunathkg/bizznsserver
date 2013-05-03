<%@ page import="javax.jcr.*"%>
<%@ page import="org.apache.sling.api.resource.Resource"%>
<%@ page import="org.apache.sling.api.resource.ResourceResolver"%>

<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>

<sling:defineObjects/>
<%
Resource aResource;
Node aNode = resource.adaptTo(Node.class);
PropertyIterator propertyIterator = aNode.getProperties();
if(propertyIterator != null) {
	while(propertyIterator.hasNext()) {
		Property property = propertyIterator.nextProperty();
		if(property!=null) {
%>
<%=property.getName() %> : <%=property.getValue().getString() %><br/>
<%			
		}
	}
}
%>
<%=resource.getPath()%>