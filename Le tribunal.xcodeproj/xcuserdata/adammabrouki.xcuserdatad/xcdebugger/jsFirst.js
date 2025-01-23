<!DOCTYPE html>
<html>
<head>
	<title>JavaScript Website</title>
</head>
<body>
	<h1>Welcome to my website!</h1>
	<p>Click the button to change the text color:</p>
	<button onclick="changeColor()">Click me</button>
	<script>
		function changeColor() {
			var color = document.body.style.backgroundColor;
			if (color === "white" || color === "") {
				document.body.style.backgroundColor = "yellow";
			} else {
				document.body.style.backgroundColor = "white";
			}
		}
	</script>
</body>
</html>
