<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Добавить Клиента</title>
</head>
<body>
<form action="/add_new_client" id="add_client">
    <label>Имя</label><br>
    <input type="text" name="firstName" id="firstName" value="" onkeyup="var yratext=/['\s','0-9',':']/;
    if(yratext.test(this.value)) this.value=''" placeholder="Введите имя клиента:"
           class="firstName" required/><br>
    <label>Фамилия</label><br>
    <input type="text" name="lastName" id="lastName" value="" onkeyup="var yratext=/['\s','0-9',':']/;
    if(yratext.test(this.value)) this.value=''" placeholder="Введите фамилию клиента:"
           class="lastName" required/><br>
    <label>Возраст</label><br>
    <input type="text" name="age" id="age" value="" onkeyup="var yratext=/['\s','A-я',':']/;
    if(yratext.test(this.value)) this.value=''" placeholder="Введите возраст клиента:"
           class="age" required/><br>
    <label>Телефон</label><br>
    <input type="text" name="phone" id="phone" value="" onkeyup="var yratext=/['A-я',':']/;
    if(yratext.test(this.value)) this.value=''" placeholder="Введите телефон клиента:"
           class="phone" required/><br>

    <input name="submit" type="submit" value="Отправить"/>
</form>
<script>
    document.getElementById('add_client').addEventListener('submit', submitForm);

    function submitForm(event) {
        event.preventDefault();
        var client = {};
        var formData = new FormData(event.target);

        formData.forEach(function (value, key) {
            client[key] = value;
        });
        formData.close;
        var json = JSON.stringify(client);
        $.ajax({
            type: 'POST',
            url: "/save",
            contentType: "application/json",
            cache: false,
            data: json,
            success: function (html) {
                window.location.reload();
                alert("Пользователь успешно создан");
            },
            error: function () {
                // Запрос не получилось отправить
                console.error("Ошибка сохранения в базу");
                alert("Ошибка сохранения в базу");
            }
        });
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>