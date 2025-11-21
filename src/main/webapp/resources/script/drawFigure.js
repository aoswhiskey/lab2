const canvas = document.getElementById("canvas");
const frame = document.getElementById("frame");
const ctx = canvas.getContext("2d");
canvas.width = frame.offsetWidth;
canvas.height = frame.offsetHeight;

drawArea(); // отрисовка фигуры при загрузке
drawAll(); // отрисовка точек из таблицы

// === Отрисовка фигуры ===
function drawArea() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Прямоугольник
    ctx.fillStyle = "#4a4e69";
    ctx.fillRect(canvas.width/2 - canvas.height/3, canvas.height/2, canvas.height/3, canvas.height/6);

    // Окружность
    ctx.beginPath();
    ctx.moveTo(canvas.width/2, canvas.height/2);
    ctx.arc(canvas.width/2, canvas.height/2, canvas.height/3, 0, 0.5 * Math.PI, false);
    ctx.closePath();
    ctx.fill();

    // Треугольник
    ctx.beginPath();
    ctx.moveTo(canvas.width/2 + canvas.height/3, canvas.height/2);
    ctx.lineTo(canvas.width/2, canvas.height/2);
    ctx.lineTo(canvas.width/2, canvas.height/3);
    ctx.closePath();
    ctx.fill();

    // Оси координат
    ctx.beginPath();
    ctx.strokeStyle = "#000";
    ctx.moveTo(canvas.width/2, 0);
    ctx.lineTo(canvas.width/2, canvas.height);
    ctx.moveTo(0, canvas.height/2);
    ctx.lineTo(canvas.width, canvas.height/2);

    // Стрелки
    ctx.moveTo(canvas.width/2, 0);
    ctx.lineTo(canvas.width/2 + 10, 15);
    ctx.moveTo(canvas.width/2, 0);
    ctx.lineTo(canvas.width/2 - 10, 15);
    ctx.moveTo(canvas.width - 10, canvas.height/2);
    ctx.lineTo(canvas.width - 25, canvas.height/2 + 10);
    ctx.moveTo(canvas.width - 10, canvas.height/2);
    ctx.lineTo(canvas.width - 25, canvas.height/2 - 10);

    // Деления
    for (let i=-2; i<=2; i++) {
        if (i === 0) continue;
        ctx.moveTo(canvas.width/2-7, canvas.height/2 + canvas.height/6*i);
        ctx.lineTo(canvas.width/2+7, canvas.height/2 + canvas.height/6*i);
        ctx.moveTo(canvas.width/2 + canvas.height/6*i, canvas.height/2-7);
        ctx.lineTo(canvas.width/2 + canvas.height/6*i, canvas.height/2+7);
    }

    ctx.stroke();

    // Подписи
    ctx.font = "16px Trebuchet MS";
    ctx.fillStyle = "#000";
    ctx.fillText("-R", canvas.width/2 - canvas.height/3 - 15, canvas.height/2 - 10);
    ctx.fillText("R", canvas.width/2 + canvas.height/3 + 5, canvas.height/2 - 10);
    ctx.fillText("-R/2", canvas.width/2 - canvas.height/6 - 25, canvas.height/2 - 10);
    ctx.fillText("R/2", canvas.width/2 + canvas.height/6 + 5, canvas.height/2 - 10);
    ctx.fillText("R", canvas.width/2 + 10, canvas.height/6 + 7);
    ctx.fillText("-R", canvas.width/2 + 10, canvas.height/2 + canvas.height/3 + 5);
    ctx.fillText("R/2", canvas.width/2 + 10, canvas.height/3 + 7);
    ctx.fillText("-R/2", canvas.width/2 + 10, canvas.height/2 + canvas.height/6 + 7);
}

canvas.addEventListener("click", function(event) {
    const rValue = document.querySelector('input[name="r"]:checked')?.value;
    if (!rValue) {
        showError();
        return;
    }

    const rect = canvas.getBoundingClientRect();
    const clickX = event.clientX - rect.left;
    const clickY = event.clientY - rect.top;

    // Центр фигуры
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;

    // Масштаб — тот же, что и при рисовании фигур
    const scale = canvas.height / 3;

    // Преобразуем пиксели в координаты X/Y
    const x = ((clickX - centerX) / scale) * rValue;
    const y = ((centerY - clickY) / scale) * rValue;

    const contextPath = window.contextPath || '/lab2'; // fallback на /lab2
    const url = `${contextPath}/main?x=${encodeURIComponent(x)}&y=${encodeURIComponent(y)}&r=${encodeURIComponent(rValue)}&areaClick=true`;

    console.log("Sending request to:", url);
    hideError();
    fetch(url)
        .then(response => response.json())
        .then(function(data) {
            let result = data[0]?.result ? "Попадание" : "Промах";
            let newRow =
                `<tr>
                            <td>${x.toFixed(5)}</td>
                            <td>${y.toFixed(5)}</td>
                            <td>${rValue}</td>
                            <td>${result}</td>
                        </tr>`;
            document.querySelector("#results tbody").insertAdjacentHTML('beforeend', newRow);

            drawPoint(x, y, rValue, data[0]?.result);
        })
        .catch(handleError);
});


function drawPoint(x, y, r, hit) {
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    const scale = canvas.height / 3;

    // Координаты пикселей (в тех же единицах, что и фигура)
    const pixelX = centerX + (x / r) * scale;
    const pixelY = centerY - (y / r) * scale;

    ctx.beginPath();
    ctx.arc(pixelX, pixelY, 4, 0, 2 * Math.PI);
    ctx.fillStyle = hit ? "#00cc66" : "#ff4b5c";
    ctx.fill();
    ctx.closePath();
}

function drawAll() {
    document.querySelectorAll('#results tbody tr').forEach(row => {
        const cells = row.querySelectorAll('td');

        if (cells.length >= 4) {
            const x = parseFloat(cells[0].textContent);
            const y = parseFloat(cells[1].textContent);
            const r = parseFloat(cells[2].textContent);
            const resultText = cells[3].textContent.trim();

            if (!isNaN(x) && !isNaN(y) && !isNaN(r)) {
                const hit = resultText === "Попадание";

                drawPoint(x, y, r, hit);
            }
        }
    });
}

// Скрытие ошибки
function hideError() {
    document.querySelector(".error_text").style.display = "none";
}

window.drawPoint = drawPoint;
window.drawArea = drawArea;
window.drawAll = drawAll;