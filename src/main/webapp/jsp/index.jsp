<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/style.css">
    <title>Weblab№2</title>
</head>
<body>
<div id="gridContainer">
    <%@include file="includes/_header.jsp" %>
    <div id="maintable">
        <div id="input-block">
            <form id="mainForm" method="GET" action="${pageContext.request.contextPath}/main">
                <p id="x">
                    Выберите координату X
                </p>
                <div id="x-input">
                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="-5" id="checkbox-1">
                        <label for="checkbox-1">-5</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="-4" id="checkbox-2">
                        <label for="checkbox-2">-4</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="-3" id="checkbox-3">
                        <label for="checkbox-3">-3</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="-1" id="checkbox-4">
                        <label for="checkbox-4">-2</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="-1" id="checkbox-5">
                        <label for="checkbox-5">-1</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="0" id="checkbox-6">
                        <label for="checkbox-6">0</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="1" id="checkbox-7">
                        <label for="checkbox-7">1</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="2" id="checkbox-8">
                        <label for="checkbox-8">2</label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="x" class="checkbox-x" value="3" id="checkbox-9">
                        <label for="checkbox-9">3</label>
                    </div>
                </div>

                <label id="y" for="y-input">
                    Выберите координату Y
                </label>
                <input type="text" name="y" class="text-y" id="y-input" placeholder="Введите координату Y (-3; 3)">

                <p id="r">
                    Выберите радиус R
                </p>
                <div id="r-input">
                    <input type="hidden" id="selected-r" name="r" value="">
                    <div class="r-button-option">
                        <button type="button" class="r-button" data-value="1">1</button>
                    </div>
                    <div class="r-button-option">
                        <button type="button" class="r-button" data-value="1.5">1.5</button>
                    </div>
                    <div class="r-button-option">
                        <button type="button" class="r-button" data-value="2">2</button>
                    </div>
                    <div class="r-button-option">
                        <button type="button" class="r-button" data-value="2.5">2.5</button>
                    </div>
                    <div class="r-button-option">
                        <button type="button" class="r-button" data-value="3">3</button>
                    </div>
                </div>

                <input type="submit" id="submit" value="Отправить">
                <div class="error_text" style="display: none;">Ошибка ввода данных</div>
            </form>
        </div>
        <div id="graph">
            <div id="frame">
                <canvas id="canvas"></canvas>
            </div>
        </div>
    </div>

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
                <c:forEach var="shot" items="${applicationScope.shots}">
                    <tr>
                        <td>${shot.graphShot.x}</td>
                        <td>${shot.graphShot.y}</td>
                        <td>${shot.graphShot.r}</td>
                        <td>
                            <c:if test="${shot.isInArea()}">
                                Попадание
                            </c:if>

                            <c:if test="${!shot.isInArea()}">
                                Промах
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@include file="includes/_footer.jsp" %>
</div>

<script>
    window.contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/script/validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/rHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/drawFigure.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/formSubmitter.js"></script>
</body>
</html>