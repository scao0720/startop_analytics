<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/startstop"
                   user="root"  password=""/>

<%-- 
    Document   : delete
    Created on : Oct 20, 2014, 10:15:52 PM
    Author     : Sabina
--%>

<sql:update>
    DELETE FROM sessions
    WHERE id = ${param.id}
</sql:update>
    <h2>You have successfully deleted the session.</h2>
    <a href="../index.jsp">Return to index</a>