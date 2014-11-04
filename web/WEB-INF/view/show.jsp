<%-- 
    Document   : show
    Created on : Oct 20, 2014, 6:22:58 PM
    Author     : Sabina
--%>

<h2>Session #${session.id}: ${session.name} </h2>
<p><fmt:formatDate value="${session.start}" pattern="yyyy-MM-dd"/></p>
<ul class="list-inline">
    <li>Start: <fmt:formatDate value="${session.start}" pattern="HH:mm:ss"/></li>
    <li>Stop: <fmt:formatDate value="${session.stop}" pattern="HH:mm:ss"/></li>
</ul>

<c:if test="${session.stop == null}">
  <strong>Add notes</strong>
    <form action="${pageContext.request.contextPath}/bullets" method="post">
        <input type="hidden" name="session_id" value="${session.id}"/>
        <table border="0">
            <tr>
                <td><textarea name="body" rows="1" cols="20"></textarea></td>
            </tr>
        </table>
        <div>
            <input type="reset" value="Reset" /><input type="submit" value="Submit" />
        </div>
    </form>
    <br>
    <form action="${pageContext.request.contextPath}/finish" method="post">
        <input type="hidden" name="id" value="${session.id}"/>
        <input type="submit" value="Stop session" />
    </form>
</c:if>
<!--Bullet stuff -->
<br>
<dl class="dl-horizontal">
    <c:forEach var="bullet" items="${bullets}">
        <dt><b><fmt:formatDate value="${bullet.created}" pattern="HH:mm:ss" />:</b></dt>
        <dd><c:out value="${bullet.body}" /></dd>
    </c:forEach>
</dl>
<a href="${pageContext.request.contextPath}/">Go back</a> | <a href="${pageContext.request.contextPath}/confirm?id=${session.id}">Delete session</a>