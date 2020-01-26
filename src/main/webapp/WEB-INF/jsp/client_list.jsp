<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <title>База Клиентов</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">

</head>
<body>

<div class="modal fade" id="modal_add">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Добавить Клиента</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button class="btn-danger" type="button" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<h1><p align="center">База Клиентов</p></h1>

<div class="container"></div>

<div class="col">
    <input type="text" class="form-control pull-right" id="search"
           style="margin-left: 30px" placeholder="Поиск по таблице">
</div>

<div id="table" class="container">
    <table class="table table-hover" id="client_table">
        <thead>
        <tr>
            <th scope="col"><p align="center">Имя</p></th>
            <th scope="col"><p align="center">Фамилия</p></th>
            <th scope="col"><p align="center">Возраст</p></th>
            <th scope="col"><p align="center">Телефон</p></th>
        </tr>
        </thead>
        <tbody class="list" id="client_tbl">
        <c:forEach var="client" items="${clients}">
            <tr id="user_${client.id}">
                <td class="client_firstName" data-field="client_firstName" id="client_firstName">
                    <p align="center">${client.firstName}</p></td>
                <td class="client_lastName" data-field="client_lastName" id="client_lastName">
                    <p align="center">${client.lastName}</p></td>
                <td class="client_age" data-field="client_age" id="client_age">
                    <p align="center">${client.age}</p></td>
                <td class="client_phone" data-field="client_phone" id="client_phone">
                    <p align="center">${client.phone}</p></td>
                <td><a type="button" class="btn btn-warning"
                       href="/delete/${client.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <a href="javascript:void(0);" data-href="/add_new_client" class="openPopup">
            <button class="btn btn-success" type="button"> Add</button>
        </a>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/modal.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/clientfilter.js"></script>
</body>
</html>
