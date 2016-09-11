<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="Редактирование продукта ${product.title} || Alex Coffee">
    <title>Редактирование продукта ${product.title} || Alex Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- EDIT PRODUCT -->
<div class="container-fluid width">
    <section id="product">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Item edition </span>
                        <span class="color-green">"${product.title}"</span>
                    </b>
                </div>
            </div>

            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                <form enctype="multipart/form-data" action="/admin/update_product" method="post">
                    <input type="hidden" name="id" value="${product.id}">
                    <table class="table">
                        <tr>
                            <th>Name:</th>
                            <td>
                                <input class="input-order" type="text" name="title"
                                       placeholder="Enter item name" value="${product.title}"
                                       minlength="5" maxlength="100" required>
                            </td>
                        </tr>
                        <tr>
                            <th>URL:</th>
                            <td>
                                <input class="input-order" type="text" name="url" pattern="[a-z0-9_]{5,50}"
                                       placeholder=" Enter URL, format (a-z, 0-9, _)" value="${product.url}"
                                       minlength="5" maxlength="50" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Category:</th>
                            <td>
                                <select class="input-order" name="category">
                                    <option value="${product.category.id}">${product.category.title}</option>
                                    <c:forEach items="${categories}" var="category">
                                        <c:if test="${category.id ne product.category.id}">
                                            <option value="${category.id}">${category.title}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Parameters:</th>
                            <td>
                                <textarea class="input-order textarea" type="text" name="parameters"
                                          placeholder="Enter item parameters"
                                          maxlength="500" required>${product.parameters}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Description:</th>
                            <td>
                                <textarea class="input-order textarea" type="text" name="description"
                                          placeholder="Enter item description"
                                          maxlength="500">${product.description}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Image:</th>
                            <td>
                                <input type="hidden" name="photo_id" value="${product.photo.id}">
                                <input class="input-order" type="text" name="photo_title"
                                       placeholder="Enter image name" value="${product.photo.title}"
                                       minlength="5" maxlength="100">
                                <br>Small: <input type="file" name="small_photo" accept="image/*">
                                <br>Large: <input type="file" name="big_photo" accept="image/*">
                            </td>
                        </tr>
                        <tr>
                            <th>Price:</th>
                            <td>
                                <input class="input-order" type="text" name="price" min="0" max="99999" step="0.01"
                                       placeholder="Enter item price" value="${product.price}" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button class="btn btn-success" type="submit"
                                        title="Save item info">Save</button>
                                <button class="btn btn-info" type="reset" title="Reset entered dada">Reset
                                </button>
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
