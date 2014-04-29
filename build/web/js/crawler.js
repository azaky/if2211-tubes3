function runCrawler() {
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange =
		function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementsById("crawlerResult").innerHTML = xmlhttp.responseText;
			}
			else {
				document.getElementsById("loading").setAttribute("src", "img/loading.gif");
			}
		}
	
	document.getElementsById("loading").setAttribute("src", "img/loading.gif");
	xmlhttp.open("POST", "crawler.php", true);
	xmlhttp.send();
}
