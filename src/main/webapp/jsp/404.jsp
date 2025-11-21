<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/style.css">
    <title>404 - Not Found</title>
</head>
<body>
<div id="gridContainer">
    <%@include file="includes/_header.jsp"%>
    
    <div class="error-404">
        <h1>404 - Not Found</h1>
        <p class="error-subtitle">The requested page could not be found</p>
        <a href="${pageContext.request.contextPath}/main" class="home-button">Go Home</a>
    </div>
    
    <%@include file="includes/_footer.jsp" %>
</div>
</body>
</html>