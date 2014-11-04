<%-- 
    Document   : index
    Created on : Oct 20, 2014, 6:06:02 PM
    Author     : Sabina
--%>

<h2>StartStop Note Taker</h2>
<p><strong>Session notes</strong></p>
<table class="table table-condensed" width: auto>
    <thead>
        <tr>
            <th width="auto">Date</th>
            <th>Title</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="session" items="${sessions}">
        <tr>
            <td><fmt:formatDate value="${session.start}" pattern="yyyy-MM-dd" /></td>
            <td><a href="${pageContext.request.contextPath}/show?id=${session.id}"><c:out value="${session.name}" /></a></td>
        </tr>
        </c:forEach>
    </tbody>
</table>
<a href="${pageContext.request.contextPath}/new">Start new session note</a>


