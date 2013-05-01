<html>
<head>
<title>Driving Sling with jQuery</title>
<script type="text/javascript"
	src="/libs/base/jquery/v1_9_1/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="/libs/base/gumby/v2.1/css/gumby.css"/>
</head>
<body>
	<script>
	$(document).ready(function(){
		$('#createButton').click(function() {
			alert('hello');
			$.post(
  				"/content/*",
  				{ ':nameHint': 'myNode', oneProperty: 'oneValue' },
  					function(data){ alert(data); }
			);
		});
	});
</script>
	<h3>Driving Sling with jQuery</h3>
	<p>Start firebug, click on Console, then go multiline (click the
		little red arrow on the bottom bottom right)</p>
	<p>enter the code below, click on 'run'</p>
	<a href="#" id="createButton">create</a>

	<p>
		Then <a href="http://localhost:8080/content/mynode.html">view your
			new node</a>
	</p>
</body>
<html>