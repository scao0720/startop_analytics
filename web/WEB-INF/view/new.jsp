<%-- 
    Document   : new
    Created on : Oct 20, 2014, 6:23:17 PM
    Author     : Sabina
--%>

<h2>Name your new session</h2>
<form action="${pageContext.request.contextPath}/create" method="post">
    <table border="0">
        <tr>
            <td><textarea name="name" rows="1" cols="20"></textarea></td>
        </tr>
    </table>
    <div>
        <input type="reset" value="Reset" /><input type="submit" value="Start session" />
    </div>
</form>
<br>
<p><a href="/">Go back</a></p>