<%-- 
    Document   : newjsp
    Created on : Jul 22, 2018, 8:21:47 PM
    Author     : Oshan Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Update Access Points Locations</h1>
        
        <form:form action = "update" method = "POST" modelAttribute="aps">
            <table >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>BSSID</th>
                        <th>X</th>
                        <th>Y</th>

                    </tr>
                </thead>

                <c:forEach var="co" items="${coordinatelist}">
                    <tr>
                        <td><input type="hidden" name="id[]" value="<c:out value='${co.id}' />" /></td>
                        <td><input  name="bssid[]" value="<c:out value='${co.bssid}' />" /></td>
                        <td><input name="x[]" value="<c:out value='${co.x}' />" /></td>
                        <td><input name="y[]" value="<c:out value='${co.y}' />" /></td>
                        
                    </tr>
                </c:forEach>
            </table>
            <br>
            <button type="submit">Update</button>

        </form:form>

    </body>
    
    
    

</html>



