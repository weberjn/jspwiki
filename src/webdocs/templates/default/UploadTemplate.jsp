<%@ taglib uri="/WEB-INF/jspwiki.tld" prefix="wiki" %>
<%@ page import="com.ecyrd.jspwiki.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.*" %>
<fmt:setBundle basename="templates.default"/>

<%
  WikiContext c = WikiContext.findContext( pageContext );
  int attCount = c.getEngine().getAttachmentManager().listAttachments(c.getPage()).size();
  String attTitle = LocaleSupport.getLocalizedMessage(pageContext, "attach.tab");
  if( attCount != 0 ) attTitle += " (" + attCount + ")";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html id="top">

<head>
  <title><fmt:message key="upload.title"><fmt:param><wiki:Variable var="applicationname"/></fmt:param></fmt:message></title>
  <wiki:Include page="commonheader.jsp"/>
  <meta name="robots" content="noindex,nofollow">
</head>

<body>

<div id="wikibody" >

  <wiki:Include page="Header.jsp" />

  <wiki:Include page="PageActionsTop.jsp"/>

  <div id="page">
    <wiki:TabbedSection defaultTab="attachments" >
      <wiki:Tab id="pagecontent" title='<%=LocaleSupport.getLocalizedMessage(pageContext, "view.tab")%>'
			   url="<%=c.getURL(WikiContext.VIEW, c.getPage().getName())%>"
	     accesskey="v" >
      </wiki:Tab>
      <wiki:PageExists>
      <wiki:Tab id="attachments" title="<%= attTitle %>" >
        <wiki:Include page="AttachmentTab.jsp"/>
      </wiki:Tab>
      <wiki:Tab id="info" title='<%=LocaleSupport.getLocalizedMessage(pageContext, "info.tab")%>'
               url="<%=c.getURL(WikiContext.INFO, c.getPage().getName())%>"
         accesskey="i" >
      </wiki:Tab>

      </wiki:PageExists>
    </wiki:TabbedSection>
  </div>

  <wiki:Include page="Favorites.jsp"/>

  <wiki:Include page="PageActionsBottom.jsp"/>

  <wiki:Include page="Footer.jsp" />

</div>
</body>

</html>