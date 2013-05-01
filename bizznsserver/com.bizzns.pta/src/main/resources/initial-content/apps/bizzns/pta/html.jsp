<html>
<head>
<title>Driving Sling with jQuery</title>
<script type="text/javascript" src="/libs/base/jquery/v1.9.1/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/libs/base/gumby/v2.1/css/gumby.css" />
</head>
<body>
	<script>
		$(document).ready(function() {
			$('#createButton').click(function() {
				alert('hello');
				$.post("/content/*", {
					':nameHint' : 'myNode',
					oneProperty : 'oneValue'
				}, function(data) {
					alert(data);
				});
			});
		});
	</script>
	<h3>Add a volunteer</h3>
	<p>Some introduction text</p>
	<form action="/content/*" method="POST">
		<input type="hidden" name=":nameHint" value="myNode"/><br/>
		<input type="text" name="oneProperty" value="oneValue"/>
	</form>
	<a href="#" id="createButton">create</a>

	<table>
	<tr>
	</tr>
	</table>
</body>
<html>