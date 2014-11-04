<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/startstop"
                   user="root"  password=""/>

<%-- 
    Document   : finish
    Created on : Oct 20, 2014, 10:41:13 PM
    Author     : Sabina
--%>

<sql:update var="result">
    UPDATE sessions 
    SET stop = now()
    WHERE id = ${param.id}
</sql:update>
    
<% response.sendRedirect("show.jsp?id="+request.getParameter("id")); %>
