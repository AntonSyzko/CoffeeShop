<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="Orders || Anton Coffee">
    <title>Orders  || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- ORDERS -->
<div class="container-fluid width">
    <section id="orders">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Orders</span>
                        <c:if test="${fn:length(orders) eq 0}">
                            <span class="color-red"> - empty list!</span>
                        </c:if>
                    </b>
                </div>
            </div>

            <c:if test="${fn:length(orders) gt 0}">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                    <table class="table">
                        <tr>
                            <th>Number</th>
                            <th>Status</th>
                            <th class="hidden-xs">Date</th>
                            <th>
                                Action
                                <a href="/admin/delete_all_orders" title="Delete all orders">
                                    <button class="btn btn-danger" type="submit">Delete ALL orders </button>
                                </a>
                            </th>
                        </tr>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.number}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status eq status_new}">
                                            <span class="color-green">${order.status.description}</span>
                                        </c:when>
                                        <c:otherwise>
                                            ${order.status.description}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="hidden-xs">${order.date}</td>
                                <td>
                                    <a href="/admin/view_order_${order.id}" title="View order ${order.number}">
                                        <button class="btn btn-info" type="submit">View</button>
                                    </a>
                                    <a href="/admin/edit_order_${order.id}" title="Edit order ${order.number}">
                                        <button class="btn btn-success" type="submit">Edit</button>
                                    </a>
                                    <a href="/admin/delete_order_${order.id}" title="Delete order ${order.number}">
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
