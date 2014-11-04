<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/startstop"
                   user="root"  password=""/>
<%-- 
    Document   : create
    Created on : Oct 20, 2014, 6:54:41 PM
    Author     : Sabina
--%>

<sql:update var="result">
    INSERT INTO sessions (name, start)
    VALUES ("${param.name}", now())
</sql:update>

<% response.sendRedirect("../index.jsp"); %>
