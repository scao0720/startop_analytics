<%-- 
    Document   : confirm
    Created on : Oct 20, 2014, 10:00:28 PM
    Author     : Sabina
--%>

<form action="${pageContext.request.contextPath}/delete" method="post">
    <p>Are you sure you want to delete session #${param.id}?</p>
    <input type="submit" value="Yes, delete this session." />
    <input type="hidden" name="id" value="${param.id}"/>
    <p><a href="show?id=${param.id}">Cancel</a></p>
</form>
