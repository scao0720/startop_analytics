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
    <form id="newbullet" action="${pageContext.request.contextPath}/bullets" method="post">
        <input type="hidden" name="session_id" value="${session.id}"/>
        <table border="0">
            <tr>
                <td><textarea id="bullet_text" name="body" rows="1" cols="20"></textarea></td>
            </tr>
        </table>
        <div>
            <input type="reset" value="Reset" /><input type="submit" value="Submit" />
        </div>
    </form>
    <br>
    <form id="endsession" action="${pageContext.request.contextPath}/finish" method="post">
        <input type="hidden" name="id" value="${session.id}"/>
        <input type="submit" value="Stop session" />
    </form>
</c:if>
<!--Bullet stuff -->
<br>
<dl id="bulletslist" class="dl-horizontal">
    <c:forEach var="bullet" items="${bullets}">
        <dt><b><fmt:formatDate value="${bullet.created}" pattern="HH:mm:ss" />:</b></dt>
        <dd><c:out value="${bullet.body}" /></dd>
    </c:forEach>
</dl>
<a href="${pageContext.request.contextPath}/">Go back</a> | <a href="${pageContext.request.contextPath}/confirm?id=${session.id}">Delete session</a>
<script>
    $("#newbullet").submit(function(event){
    ga('send', 'event', 'button', 'click', 'add bullet');
    var now = new Date();
    var time = ("0" + now.getHours()).slice(-2) + ":" + ("0" + now.getMinutes()).slice(-2) + ":" + ("0" + now.getSeconds()).slice(-2);
    var bulletbullet = $("#bullet_text").val()
            $.ajax({
            type: "POST",
                    url: "${pageContext.request.contextPath}/bullets",
                    data: $("#newbullet").serialize(),
                    success: function(data){
                    $('#bulletslist').append(
                            '<dt>' + time + ':</dt>',
                            '<dd>' + bulletbullet + '</dd>');
                    }
            });
            $("#bullet_text").val("");
            event.preventDefault();
            });
    $("#endsession").submit(function(){
    ga('send', 'event', 'button', 'click', 'end session');
    });
</script>
