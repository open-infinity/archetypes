#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<div id="statusbox">
	<br/>
	<c:forEach items="${symbol_dollar}{errorStatuses.errorLevelExceptions}" var="exception">
		<label for="${symbol_dollar}{exception}"><spring:message code="${symbol_dollar}{exception}" /></label>
	</c:forEach>
	<br />
	<br />
	<c:forEach items="${symbol_dollar}{errorStatuses.warningLevelExceptions}" var="exception">
		<label for="${symbol_dollar}{exception}"><spring:message code="${symbol_dollar}{exception}" /></label>
	</c:forEach>
	<br />
	<br />
	<c:forEach items="${symbol_dollar}{errorStatuses.informativeLevelExceptions}" var="exception">
		<label for="${symbol_dollar}{exception}"><spring:message code="${symbol_dollar}{exception}" /></label>
	</c:forEach>
</div>
<br />
