<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/startstop"
                   user="root"  password=""/>

<%-- 
    Document   : update
    Created on : Oct 20, 2014, 7:16:27 PM
    Author     : Sabina
--%>

<sql:update var="result">
    INSERT INTO bullets (session_id, body, created)
    VALUES (${param.session_id}, "${param.body}", now())
</sql:update>

<% response.sendRedirect("show.jsp?id="+request.getParameter("session_id")); %>