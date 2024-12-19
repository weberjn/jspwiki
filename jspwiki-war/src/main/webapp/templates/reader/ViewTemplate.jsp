<%--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
--%>

<%@ taglib uri="http://jspwiki.apache.org/tags" prefix="wiki" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="org.apache.wiki.api.core.*" %>
<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="templates.default"/>
<!doctype html>
<html lang="<c:out value='${prefs.Language}' default='en'/>" name="top">
  <head>
  <meta charset="<wiki:ContentEncoding />">
  <title>
    <fmt:message key="view.title.view">
      <fmt:param><wiki:Variable var="ApplicationName" default="Apache JSPWiki" /></fmt:param>
      <fmt:param><wiki:PageName /></fmt:param>
    </fmt:message>
  </title>
  <%--<wiki:Include page="commonheader.jsp"/>--%>
<script type="text/javascript">//<![CDATA[
/* Localized javascript strings: LocalizedStrings[] */
<wiki:IncludeResources type="jslocalizedstrings"/>
String.I18N = LocalizedStrings;
String.I18N.PREFIX = "javascript.";
//]]></script>

<meta name="wikiContext" content='<wiki:Variable var="requestcontext" />' />
<wiki:Permission permission="edit"><meta name="wikiEditPermission" content="true"/></wiki:Permission>
<meta name="wikiBaseUrl" content='<wiki:BaseURL />' />
<meta name="wikiPageUrl" content='<wiki:Link format="url"  page="#$%"/>' />
<meta name="wikiEditUrl" content='<wiki:EditLink format="url" page="#$%"/>' />
<meta name="wikiCloneUrl" content='<wiki:EditLink format="url" page="#$%"/>&clone=<wiki:Variable var="pagename" />' />
<meta name="wikiJsonUrl" content='<%=  Context.findContext(pageContext).getURL( ContextEnum.PAGE_NONE.getRequestContext(), "ajax" ) %>' /><%--unusual pagename--%>
<meta name="wikiPageName" content='<wiki:Variable var="pagename" />' /><%--pagename without blanks--%>
<meta name="wikiUserName" content='<wiki:UserName />' />
<meta name="wikiTemplateUrl" content='<wiki:Link format="url" templatefile="" />' />
<meta name="wikiApplicationName" content='<wiki:Variable var="ApplicationName" />' />
<%--CHECKME
    <wiki:link> seems not to lookup the right jsp from the right template directory
    EG when a templatefile is not present, the generated link should point to the default template.
    Solution for now: manually force the relevant links back to the default template
--%>
<meta name="wikiXHRSearch" content='<wiki:Link format="url" templatefile="../default/AJAXSearch.jsp" />' />
<meta name="wikiXHRPreview" content='<wiki:Link format="url" templatefile="../default/AJAXPreview.jsp" />' />
<meta name="wikiXHRCategories" content='<wiki:Link format="url" templatefile="../default/AJAXCategories.jsp" />' />

<%-- Generated by https://realfavicongenerator.net/ --%>
<link rel="apple-touch-icon" sizes="180x180" href="favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicons/favicon-16x16.png">
<link rel="manifest" href="favicons/site.webmanifest">
<link rel="mask-icon" href="favicons/safari-pinned-tab.svg" color="#da532c">
<link rel="shortcut icon" href="favicons/favicon.ico">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="msapplication-config" content="favicons/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<meta name="robots" content="noindex,nofollow" />

<%-- FIXME: for now, reuse haddock's stylesheet --%>
<link rel="stylesheet" media="screen, projection, print" type="text/css"
     href="<wiki:Link format='url' templatefile='../../templates/default/haddock.css'/>"/>

</head>

<body class="reader context-<wiki:Variable var='requestcontext' default='' />" >

<div class="container ${prefs.Orientation}">

  <div class="pagename"><wiki:Link><wiki:PageName/></wiki:Link></div>
  <div class="page"><wiki:Include page="PageTab.jsp"/></div>
  <div class="copyright center"><wiki:InsertPage page="CopyrightNotice"/></div>

</div>

<script type="text/javascript" src="<wiki:Link format='url' jsp='scripts/haddock.js'/>"></script>
</body>
</html>