<%@page import="java.util.ArrayList" %>
<%@page import="web.lab2.model.ShotResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/style.css">
    <title>Result Page</title>
</head>
<body>
<div id="gridContainer">
    <%@include file="includes/_header.jsp" %>
    <div id="datatable">
        <div class="gui" id="data-block">
            <table id="results">
                <thead>
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Точка входит в ОДЗ</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="i" begin="1" end="${applicationScope.shotCount}">
                    <tr>
                        <td>${applicationScope.shots.get(applicationScope.shots.size()-i).getGraphShot().getX()}</td>
                        <td>${applicationScope.shots.get(applicationScope.shots.size()-i).getGraphShot().getY()}</td>
                        <td>${applicationScope.shots.get(applicationScope.shots.size()-i).getGraphShot().getR()}</td>
                        <td>
                            <c:if test="${applicationScope.shots.get(applicationScope.shots.size()-i).isInArea()}">
                                Попадание
                            </c:if>

                            <c:if test="${!applicationScope.shots.get(applicationScope.shots.size()-i).isInArea()}">
                                Промах
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div id="backLinkWrapper">
        <a href="${pageContext.request.contextPath}/main" class="home-button">Go Home</a>
    </div>
    <%@include file="includes/_footer.jsp" %>
</div>
</body>
</html>
