<%-- 
    Document   : search
    Created on : Apr 23, 2014, 12:58:21 PM
    Author     : Toshiba
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="humbala.*"%>
<%@page import="java.util.*"%>
<%@page import="twitter4j.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9Nf8rzj1Lkyr0G2xCeqxWaAbT-Xk0vjw&sensor=false"> type="text/javascript"></script>
    <script>
var geocoder;
var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var mapOptions = {
        zoom: 13,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress(address) {
    //var address = document.getElementById('address').value;
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
             position: results[0].geometry.location
         });
      } else {
         alert('Geocode was not successful for the following reason: ' + status);
      }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    </head>
    <body>
        <h1>Hello World!</h1>
    <div id="panel">
        <input id="address" type="textbox" value="Institut Teknologi Bandung">
        <input type="button" value="Geocode" onclick="codeAddress(document.getElementById('address').value)">
    </div>
    <div id="map-canvas" style="width: 500px; height: 300px; position: relative; background-color: rgb(229, 227, 223);"></div>
        <%
        Bonbon a = new Bonbon();
        QueryResult q = a.search(request.getParameter("search"));
        List<Status> result = a.getStatus();
        Pattern regex = Pattern.compile("@(\\w*)");
        Pattern regex2 = Pattern.compile("#(\\w*)");
        for (Status xxx : q.getTweets()) {
            String status = xxx.getText();
            Matcher rm = regex.matcher(status);
            StringBuffer res = new StringBuffer();
            while (rm.find()) {
                rm.appendReplacement(res, "<a target='_blank' href='http://www.twitter.com/" + rm.group(1) + "'>@" + rm.group(1) + "</a>");
            }
            rm.appendTail(res);
            Matcher rm2 = regex2.matcher(res.toString());
            res = new StringBuffer();
            while (rm2.find()) {
                rm2.appendReplacement(res, "<a target='_blank' href='https://twitter.com/search?q=%23" + rm2.group(1) + "'>#" + rm2.group(1) + "</a>");
            }
            rm2.appendTail(res);
            String link = "https://twitter.com/#!/" + xxx.getUser().getScreenName() + "/status/" + xxx.getId();
            out.println("<img src=\"" + xxx.getUser().getProfileImageURL() + "\"/>");
            //out.println("<a target='_blank' href='"+link+"'>link</a>");
            out.println("<div style='border:#ffffff' onclick=\"window.open('"+link+"')\"><p>" + "<a target='_blank' href='http://www.twitter.com/" + xxx.getUser().getScreenName() + "'>@" + xxx.getUser().getScreenName() + "</a>" + ": " + res.toString() + "</p></div>");
            List<String> locs = Bonbon.findPattern(xxx.getText());
            out.print("<p>");
            for (String s : locs) {
                out.print(s + ", ");
            }
            out.println("</p>");
        }
        %>
    </body>
</html>
