<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="${product.title} || Anton Coffee">
    <title>${product.title} || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- PRODUCT -->
<div class="container-fluid width">
    <section id="product">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Item </span>
                        <span class="color-green">"${product.title}"</span>
                    </b>
                </div>
            </div>

            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                <table class="table">
                    <tr>
                        <th>Name:</th>
                        <td>
                            <a href="/product_${product.url}"
                               title="Go to item ${product.title}">
                                ${product.title}
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <th>Category:</th>
                        <td>
                            <a href="/admin/view_category_${product.id}"
                               title="View category ${product.category.title}">
                                ${product.category.title}</a>
                        </td>
                    </tr>
                    <tr>
                        <th>Parameters:</th>
                        <td>${product.parameters}</td>
                    </tr>
                    <tr>
                        <th>Description:</th>
                        <td>${product.description}</td>
                    </tr>
                    <tr>
                        <th>Image:</th>
                        <td>
                            ${product.photo.title}
                            </br><img width="75px" height="75px"
                                      src="/resources/img/added/${product.photo.photoLinkShort}">
                            <c:if test="${product.photo.photoLinkLong ne null}">
                                <img width="100px" height="100px"
                                     src="/resources/img/added/${product.photo.photoLinkLong}">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>Price:</th>
                        <td>${product.price}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href="/admin/edit_product_${product.id}"
                               title="Edit item ${product.title}">
                                <button class="btn btn-success" type="submit">Edit</button>
                            </a>
                            <a href="/admin/delete_product_${product.id}"
                               title="Delete item ${product.title}">
                                <button class="btn btn-danger" type="submit">Delete</button>
                            </a>
                            <a href="/admin/products" title="Вернуться к списку товаров">
                                <button class="btn btn-info" type="submit">Back</button>
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</div>
</body>
</html>
