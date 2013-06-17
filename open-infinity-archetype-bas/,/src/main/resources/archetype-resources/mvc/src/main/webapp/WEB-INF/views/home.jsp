#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/common/includes.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br />
	<h2>Open Infinity - Show case.</h2>
	<br />
	<div class="sub_menu"><b>The Shopping Application</b></div>
	<br />	
	<p><spring:message code="server.time"/> ${symbol_dollar}{serverTime}.</p>
		<br/><br/>
		<a href="manager">View Shopping lists</a> or <a href="productModel">Create a new product</a> or <a href="manager/shoppinglist">Manage Shoppinglists</a>  or <a href="manager/shoppinglist">Manage Catalogues</a>
		<br/><br/>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>