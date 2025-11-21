// Обработка кнопок для выбора R
document.addEventListener('DOMContentLoaded', function() {
    const rButtons = document.querySelectorAll('.r-button');
    const selectedRInput = document.getElementById('selected-r');

    // Если элементы не найдены, выходим
    if (!rButtons.length || !selectedRInput) {
        console.warn('R buttons or selected R input not found');
        return;
    }

    rButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Убираем активный класс со всех кнопок
            rButtons.forEach(btn => {
                btn.classList.remove('active');
                btn.classList.remove('r-active');
            });

            // Добавляем активный класс к нажатой кнопке
            this.classList.add('active');
            this.classList.add('r-active');

            // Устанавливаем значение в скрытое поле
            selectedRInput.value = this.getAttribute('data-value');

            console.log('Selected R:', selectedRInput.value); // Для отладки
        });
    });

    window.getCurrentR = function() {
        return selectedRInput.value;
    };
});