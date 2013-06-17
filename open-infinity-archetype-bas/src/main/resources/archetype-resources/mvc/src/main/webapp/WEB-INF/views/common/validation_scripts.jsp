#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<script type="text/javascript">	

	${symbol_dollar}(document).ready(function() {
		${symbol_dollar}("${symbol_pound}${symbol_dollar}{model}").submit(function() {
			var request = ${symbol_dollar}(this).serializeObject();
			${symbol_dollar}.postJSON("${symbol_dollar}{model}", request, 
			function(request) {
				setStatusField("Product registered successfully!");
				${symbol_dollar}.each(${symbol_dollar}('${symbol_pound}${symbol_dollar}{model}').serializeArray(), function(i, field) {
				    fieldValidated(field.name, { valid : true });
				});
			}, 
			function(error) {
				// Set default view
				${symbol_dollar}.each(${symbol_dollar}('${symbol_pound}${symbol_dollar}{model}').serializeArray(), function(i, field) {
				    fieldValidated(field.name, { valid : true });
				});
				// Set error view
				var obj = jQuery.parseJSON(error.responseText);
				var errorCounter = 0;
				var businessViolation = false;
				${symbol_dollar}.each(obj, function(key, val) {
					if (${symbol_dollar}.isArray(val)) {
						var realArray = ${symbol_dollar}.makeArray(val);
						${symbol_dollar}.map(realArray, function(item, i) {
							document.getElementById('statusbox').innerHTML=item;
							businessViolation = true;
						});
					} else {
						fieldValidated(key, { valid : false, message : val});
						errorCounter++;
					}
				});
				if (!businessViolation)
					setStatusField("Product under editing contains " + errorCounter + " warning messages.");
			});
			return false;				
		});
	});
	
	function checkErrorFieldStatusForObject(field) {
		if (field==true) {
			fieldValidated(field, { valid : true });
		} else {
			fieldValidated(field, { valid : false, message : ${symbol_dollar}('${symbol_pound}'+field).val() + " is not valid."});
		}
	}
	
	function setStatusField(status) {
		document.getElementById('statusbox').innerHTML=status;
	}
	
	function validateField(validationUrl, field) {
		${symbol_dollar}.getJSON(validationUrl, { name: ${symbol_dollar}("${symbol_pound}" + field).val() }, function(fieldStatus) {
			if (fieldStatus.stringFieldValid) {
				fieldValidated(field, { valid : true });
			} else {
				fieldValidated(field, { valid : false, message : ${symbol_dollar}("${symbol_pound}" + field).val() + " field contains errros: "+ fieldStatus.stringFieldInvalid});
			}
		});
	}

	function fieldValidated(field, result) {
		if (result.valid) {
			${symbol_dollar}("${symbol_pound}" + field).css({backgroundColor: 'white', border: '1px solid black', color: 'black', border: '3px inset green', foreGround: 'green'});
			${symbol_dollar}("${symbol_pound}" + field + "Label").removeClass("error");
			${symbol_dollar}("${symbol_pound}" + field + "${symbol_escape}${symbol_escape}.errors").remove();
			${symbol_dollar}('${symbol_pound}create').attr("disabled", false);
		} else {
			${symbol_dollar}("${symbol_pound}" + field + "Label").addClass("error");
			if (${symbol_dollar}("${symbol_pound}" + field + "${symbol_escape}${symbol_escape}.errors").length == 0) {
				${symbol_dollar}("${symbol_pound}" + field).css({backgroundColor: '${symbol_pound}ffe', border: '3px inset red'});
				${symbol_dollar}("${symbol_pound}" + field).after("<span id='" + field + ".errors'> " + result.message + "</span>").css({color: 'red'});		
			} else {
				${symbol_dollar}("${symbol_pound}" + field + "${symbol_escape}${symbol_escape}.errors").html("<span id='" + field + ".errors'> " + result.message + "</span>");		
			}				
		}			
	}

	function resetForm() {
		${symbol_dollar}('${symbol_pound}${symbol_dollar}{model}')[0].reset();
	}
	
</script>