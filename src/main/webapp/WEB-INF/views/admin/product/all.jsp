<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="Coffee || Anton Coffee">
    <title>Coffee || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- PRODUCTS -->
<div class="container-fluid width">
    <section id="products admin-page">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Items</span>
                        <c:if test="${fn:length(products) eq 0}">
                            <span class="color-red"> - empty list!</span>
                            <br>
                            <a href="/admin/add_product" title="Add new item">
                                <button class="btn btn-success" type="submit">Add</button>
                            </a>
                        </c:if>
                    </b>
                </div>
            </div>

            <c:if test="${fn:length(products) gt 0}">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                    <table class="table">
                        <tr>
                            <th width="40%">Name</th>
                            <th class="hidden-xs" width="15%">Category</th>
                            <th width="35%">
                                Action
                                <a href="/admin/add_product" title="Add new  item">
                                    <button class="btn btn-success" type="submit">Add</button>
                                </a>
                                <a href="/admin/delete_all_products" title="Delete al items">
                                    <button class="btn btn-danger" type="submit">Delete ALL</button>
                                </a>
                            </th>
                        </tr>

                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td>
                                    <a href="/product_${product.url}"
                                       title="Go to item ${product.title}">
                                            ${product.title}</a>
                                </td>
                                <td class="hidden-xs">
                                    <a href="/admin/view_category_${product.category.id}"
                                       title="View  category ${product.category.title}">
                                            ${product.category.title}</a>
                                </td>
                                <td>
                                    <a href="/admin/view_product_${product.id}"
                                       title="View item ${product.title}">
                                        <button class="btn btn-info" type="submit">View</button>
                                    </a>
                                    <a href="/admin/edit_product_${product.id}"
                                       title="Edit item ${product.title}">
                                        <button class="btn btn-success" type="submit">Edit</button>
                                    </a>
                                    <a href="/admin/delete_product_${product.id}"
                                       title="Delete item ${product.title}">
                                        <button class="btn btn-danger" type="submit">Delete</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
        </div>
    </section>
</div>
</body>
</html>
