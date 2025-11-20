<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 14.11.2025
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ошибка</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/style.css">
</head>
<body>
<div id="gridContainer">
    <%@include file="includes/_header.jsp"%>
    <div id="message_window">
        <p>${applicationScope.current_error}</p>
    </div>
    <%@include file="includes/_footer.jsp" %>
</div>
</body>
</html>
