<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/style.css">
    <title>403 - Forbidden</title>
</head>
<body>
<div id="gridContainer">
    <%@include file="includes/_header.jsp"%>
    
    <div class="error-403">
        <h1>403 - Forbidden</h1>
        
        <!-- Гифка -->
        <img src="${pageContext.request.contextPath}/resources/img/noright.gif" 
             alt="No access" 
             class="error-gif">
        
        <a href="${pageContext.request.contextPath}/main" class="home-button">Back to Home</a>
    </div>
    
    <%@include file="includes/_footer.jsp" %>
</div>
</body>
</html>