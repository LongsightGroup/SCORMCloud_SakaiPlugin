<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.rusticisoftware.scormcloud.tool.ScormCloudToolBean" %>
<%@ page import="com.rusticisoftware.scormcloud.model.ScormCloudPackage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%
    // Get the backing bean from the spring context
    WebApplicationContext context = 
        WebApplicationContextUtils.getWebApplicationContext(application);
    ScormCloudToolBean bean = (ScormCloudToolBean)context.getBean("scormCloudToolBean");
    
    bean.doPageChecks(request, response);
    
    pageContext.setAttribute("bean", bean);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="/library/js/headscripts.js" language="JavaScript" type="text/javascript"></script>
<link media="all" href="/library/skin/tool_base.css" rel="stylesheet" type="text/css"/>
<link media="all" href="/library/skin/default/tool.css" rel="stylesheet" type="text/css"/>
<link media="all" href="css/ScormCloud.css" rel="stylesheet" type="text/css"/>

<script language="Javascript" type="text/javascript" src="javascript/reportage.combined.js"></script>
<link media="all" rel="stylesheet" type="text/css" href="css/reportage.combined.sakai.css"></link>

<script language="Javascript" type="text/javascript">
	$(document).ready( function() {
		loadScript('${registrationSummaryUrl}');
		loadScript('${learnerCourseActivitiesUrl}');
		loadScript('${learnerCourseInteractionsUrl}');
		loadScript('${learnerCourseCommentsUrl}');
	});
</script>

<title>SCORM Cloud Reportage</title>
</head>
<body onload="<%= request.getAttribute("sakai.html.body.onload") %>">
<div class="portletBody">

	<%@ include file="Menu.jsp" %>
	
	<h3 class="insColor insBak insBorder">SCORM Cloud Reportage</h3>
	
	<%@ include file="Messages.jsp" %>
	
	
	<div class="instruction">
		Shown below are reports which show aggregate information about 
		all of the registrations that <b>${learnerName}</b>
		has launched for the resource <b>${pkgName}</b>.
		Report data current as of ${reportDate} UTC.
	</div>
	
	<div class="group_summary_report_wrapper">
		<div style="height:20px"></div>
	
		<div id="registrationSummary" class="reportage_summary gray_text">Loading...</div>
	
		<div style="height:20px"></div>
		
		<table class="group_report_details_table">
			<tr>
				<td class="group_report_details_holder">
					<div id="learnerCourseActivities" class="reportage_details gray_text">Loading...</div>
				</td>
				<td><div style="width:20px"></div></td>
				<td class="group_report_details_holder">
					<div id="learnerCourseInteractions" class="reportage_details gray_text">Loading...</div>
					<div style="height:20px"></div>
					<div id="learnerCourseComments" class="reportage_details gray_text">Loading...</div>
				</td>
			</tr>
		</table>
	</div>

</div>
</body>
</html>
