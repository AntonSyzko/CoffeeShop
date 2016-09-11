<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="New  Item || Anton Coffee">
    <title>New Item || Alex Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- ADD PRODUCT -->
<div class="container-fluid width">
    <section id="product">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-green">New </span>
                        <span class="color-brown">Item</span>
                    </b>
                </div>
            </div>

            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                <form enctype="multipart/form-data" action="/admin/save_product" method="post">
                    <table class="table">
                        <tr>
                            <th>Name:</th>
                            <td>
                                <input class="input-order" type="text" name="title"
                                       placeholder="Enter the item name:"
                                       minlength="5" maxlength="100" required>
                            </td>
                        </tr>
                        <tr>
                            <th>URL:</th>
                            <td>
                                <input class="input-order" type="text" name="url" pattern="[a-z0-9_]{5,50}"
                                       placeholder=" Enter URL, format (a-z, 0-9, _)"
                                       minlength="5" maxlength="50" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Category:</th>
                            <td>
                                <select class="input-order" name="category">
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}">${category.title}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Parameters:</th>
                            <td>
                                <textarea class="input-order textarea" type="text" name="parameters"
                                          placeholder="Введите параметры товара" maxlength="500" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Description:</th>
                            <td>
                                <textarea class="input-order textarea" type="text" name="description"
                                          placeholder="Введите описание товара" maxlength="500"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Image:</th>
                            <td>
                                <input class="input-order" type="text" name="photo_title"
                                       placeholder="Enter the  image name"
                                       minlength="5" maxlength="100" required>
                                <br>Small: <input type="file" name="small_photo" accept="image/*">
                                <br>Big: <input type="file" name="big_photo" accept="image/*">
                            </td>
                        </tr>
                        <tr>
                            <th>Price:</th>
                            <td>
                                <input class="input-order" type="number" name="price"
                                       placeholder="Enter the  item price"
                                       min="0" max="99999" step="0.01" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button class="btn btn-success" type="submit">Add item</button>
                                <button class="btn btn-info" type="reset">Reset</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>
