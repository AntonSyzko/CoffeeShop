<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="Order ${order.number} || Anton Coffee">
    <title>Order ${order.number} || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- ORDER -->
<div class="container-fluid width">
    <section id="order">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Order </span>
                        <span class="color-green">${order.number}</span>
                    </b>
                </div>
            </div>

            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                <table class="table">
                    <tr>
                    <th>Number:</th>
                    <td>${order.number}</td>
                </tr>
                    <tr>
                        <th>State:</th>
                        <td>
                            <c:choose>
                                <c:when test="${order.status eq status_new}">
                                    <span class="color-green"><b>${order.status.description}</b></span>
                                </c:when>
                                <c:otherwise>
                                    ${order.status.description}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Date:</th>
                        <td>${order.date}</td>
                    </tr>
                    <tr>
                        <th>Order processed by:</th>
                        <td>
                            <c:choose>
                                <c:when test="${order.manager eq null}">
                                    -
                                </c:when>
                                <c:when test="${order.manager ne null}">
                                    <c:choose>
                                        <c:when test="${order.manager.role eq admin_role}">
                                            <span class="color-red">${order.manager.role.description}</span>
                                        </c:when>
                                        <c:when test="${order.manager.role eq manager_role}">
                                            <span class="color-green">${order.manager.role.description}</span>
                                        </c:when>
                                        <c:otherwise>
                                            ${order.manager.role.description}
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="/admin/view_user_${order.manager.id}">${order.manager.name}</a>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Client:</th>
                        <td>
                            Name: <b>${order.client.name}</b>
                            <br>Email: <b>${order.client.email}</b>
                            <br>Phone: <b>${order.client.phone}</b>
                        </td>
                    </tr>
                    <tr>
                        <th>Shipping address:</th>
                        <td>
                            <c:choose>
                                <c:when test="${(order.shippingAddress eq null) or (order.shippingAddress eq '')}">
                                    -
                                </c:when>
                                <c:when test="${order.shippingAddress ne null}">
                                    ${order.shippingAddress}
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Shipping details:</th>
                        <td>
                            <c:choose>
                                <c:when test="${(order.shippingDetails eq null) or (order.shippingDetails eq '')}">
                                    -
                                </c:when>
                                <c:when test="${order.shippingDetails ne null}">
                                    ${order.shippingDetails}
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Comments:</th>
                        <td>
                            <c:choose>
                                <c:when test="${(order.description eq null) or (order.description eq '')}">
                                    -
                                </c:when>
                                <c:when test="${order.description ne null}">
                                    ${order.description}
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Items:</th>
                        <td>
                            <c:choose>
                                <c:when test="${fn:length(sale_positions) eq 0}">
                                    Empty Items List!
                                </c:when>
                                <c:when test="${fn:length(sale_positions) gt 0}">
                                    <c:forEach items="${sale_positions}" var="position">
                                        <a href="/product_${position.product.url}"
                                           title="Go to the  Item ${position.product.title}">
                                                ${position.product.title}</a>, № ${position.product.id},
                                        <br>${position.number} x ${position.product.price} EUR
                                        <br>--------------<br>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Total sum:</th>
                        <td><b>${order_price}</b> EUR</td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <a href="/admin/edit_order_${order.id}" title="Edit order ${order.number}">
                                <button class="btn btn-success" type="submit">Edit</button>
                            </a>
                            <a href="/admin/delete_order_${order.id}" title="Delete order ${order.number}">
                                <button class="btn btn-danger" type="submit">Delete</button>
                            </a>
                            <a href="/admin/orders" title="Back to the  order  list">
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
