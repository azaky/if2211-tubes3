<%-- 
    Document   : newjsp
    Created on : Apr 22, 2014, 11:56:24 AM
    Author     : Toshiba
--%>

<%@page import="humbala.*"%>
<%@page import="java.util.*"%>
<%@page import="twitter4j.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Halo <b><%= request.getParameter("username")%></b>!</p>
        <ul>
        <%
        Bonbon a = new Bonbon();
        List<String> s = a.getHaha(Integer.parseInt(request.getParameter("humbala")));
        for (String _s : s) {
            out.println("<li>" + _s + "</li>");
        }
        %>
        </ul>
        <%
        QueryResult q = a.search(request.getParameter("keywords"));
        List<Status> result = a.getStatus();
        for (Status xxx : q.getTweets()) {
            out.println("<img src=\"" + xxx.getUser().getProfileImageURL() + "\"/>");
            out.println("<p>" + "<a href=\"http://www.twitter.com/" + xxx.getUser().getScreenName() + "\">@" + xxx.getUser().getScreenName() + "</a>" + ": " + xxx.getText() + "</p>");
        }
        %>
    </body>
</html>
