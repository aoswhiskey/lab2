const form = document.getElementById('mainForm');

form.addEventListener('submit', function(event) {

    const selectedXOptions = document.querySelectorAll('input[name="x"]:checked');
    const yValue = truncateNumber(document.getElementById("y-input").value, 10);
    const rValue = document.querySelector('input[name="r"]:checked').value;

    const xRegExp = /^(-5|-4|-3|-2|-1|0|1|2|3)$/;
    const yRegExp = /^(-?[0-2](\.\d+)?)$/;
    const rRegExp = /^(1|1\.5|2|2\.5|3)$/;

    // Проверка на заполненность полей
    if (selectedXOptions.length === 0 || !yValue || !rValue) {
        event.preventDefault();
        showError();
        return;
    }

    // Валидация значений
    const xValues = Array.from(selectedXOptions).map(option => option.value);
    const allXValid = xValues.every(x => xRegExp.test(x));
    const yValid = yRegExp.test(yValue);
    const rValid = rRegExp.test(rValue);

    if (!allXValid || !yValid || !rValid) {
        event.preventDefault();
        showError();
        return;
    }

    // Если все ок - форма отправится автоматически
    hideError();
});

// Отображение ошибки
function showError() {
    document.querySelector(".error_text").style.display = "block";
}

// Скрытие ошибки
function hideError() {
    document.querySelector(".error_text").style.display = "none";
}

// Обработка ошибки запроса
function handleError(error) {
    console.error("Ошибка:", error);
}

// Обрезка числа до заданного количества десятичных знаков
function truncateNumber(num, decimalPlaces) {
    const numStr = num.toString();
    const dotIndex = numStr.indexOf('.');

    if (dotIndex === -1) {
        return numStr;
    }

    return numStr.slice(0, dotIndex + decimalPlaces + 1);
}